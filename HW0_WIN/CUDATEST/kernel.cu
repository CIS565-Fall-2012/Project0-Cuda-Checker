// CIS565 CUDA Checker: A simple CUDA hello-world style program for Patrick Cozzi's CIS565: GPU Computing at the University of Pennsylvania
// Written by Yining Karl Li, Copyright (c) 2012 University of Pennsylvania
// This file includes code from:
//       Rob Farber for CUDA-GL interop, from CUDA Supercomputing For The Masses: http://www.drdobbs.com/architecture-and-design/cuda-supercomputing-for-the-masses-part/222600097

#include <stdio.h>
#include <cuda.h>
#include <cmath>
#include <cutil_math.h>
#include "kernel.h"
#include <iostream>

void checkCUDAError(const char *msg) {
  cudaError_t err = cudaGetLastError();
  if( cudaSuccess != err) {
    fprintf(stderr, "Cuda error: %s: %s.\n", msg, cudaGetErrorString( err) ); 
    exit(EXIT_FAILURE); 
  }
} 

//Kernel that writes the image to the OpenGL PBO directly. 
__global__ void createVersionVisualization(uchar4* PBOpos, int width, int height, int major, int minor){
  
  int x = (blockIdx.x * blockDim.x) + threadIdx.x;
  int y = (blockIdx.y * blockDim.y) + threadIdx.y;
  int index = x + (y * width);
  
  if(x<=width && y<=height){ 
      // Each thread writes one pixel location in the texture (textel)
      PBOpos[index].w = 0;
      PBOpos[index].x = 0;     
      PBOpos[index].y = 0;
      PBOpos[index].z = 0;

      if(y<height/2){
        if(major==1){
          PBOpos[index].x = 255;  
        }else if(major==2){
          PBOpos[index].y = 255;  
        }else if(major==3){
          PBOpos[index].z = 255;  
        }
      }else{
        if(minor==0){
          PBOpos[index].x = 255;  
        }else if(minor==1){
          PBOpos[index].y = 255;  
        }else if(minor==2){
          PBOpos[index].z = 255;  
        }else if(minor==3){
          PBOpos[index].x = 255;  
          PBOpos[index].y = 255;  
        }else if(minor==5){
          PBOpos[index].z = 255;  
          PBOpos[index].y = 255;  
        }
      }
  }
}

// Wrapper for the __global__ call that sets up the kernel calls and does a ton of memory management
void cudaKernel(uchar4* PBOpos, int width, int height, int major, int minor){
  
  // set up crucial magic
  int tileSize = 16;
  dim3 threadsPerBlock(tileSize, tileSize);
  dim3 fullBlocksPerGrid((int)ceil(width/float(tileSize)), (int)ceil(height/float(tileSize)));
  
  //kernel launches
  createVersionVisualization<<<fullBlocksPerGrid, threadsPerBlock>>>(PBOpos, width, height, major, minor);
  // make certain the kernel has completed 
  cudaThreadSynchronize();

  checkCUDAError("Kernel failed!");
}
