// CIS565 CUDA Checker: A simple CUDA hello-world style program for Patrick Cozzi's CIS565: GPU Computing at the University of Pennsylvania
// Written by Yining Karl Li, Copyright (c) 2012 University of Pennsylvania
// This file includes code from:
//       Rob Farber for CUDA-GL interop, from CUDA Supercomputing For The Masses: http://www.drdobbs.com/architecture-and-design/cuda-supercomputing-for-the-masses-part/222600097

#ifndef KERNEL_H
#define KERNEL_H

#include <cuda.h>
#include <cmath>
#include <cutil_math.h>

void cudaKernel(uchar4* pos, int width, int height, int major, int minor);

#endif //KERNEL_H
