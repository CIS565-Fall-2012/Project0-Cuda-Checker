// CIS565 CUDA Checker: A simple CUDA hello-world style program for Patrick Cozzi's CIS565: GPU Computing at the University of Pennsylvania
// Written by Yining Karl Li, Copyright (c) 2012 University of Pennsylvania
// This file includes code from:
//       Rob Farber for CUDA-GL interop, from CUDA Supercomputing For The Masses: http://www.drdobbs.com/architecture-and-design/cuda-supercomputing-for-the-masses-part/222600097
//       Varun Sampath and Patrick Cozzi for GLSL Loading, from CIS565 Spring 2012 HW5 at the University of Pennsylvania: http://cis565-spring-2012.github.com/

#ifndef MAIN_H
#define MAIN_H

#include <stdlib.h>
#include <GL/glfw.h>
#include <cuda_runtime.h>
#include <cutil_inline.h>
#include <cutil_gl_inline.h>
#include <cutil_gl_error.h> 
#include <cuda_gl_interop.h>
#include <string>
#include <iostream>
#include "kernel.h"
#include "glslUtility.h"

using namespace std;

//-------------------------------
//------------GL STUFF-----------
//-------------------------------

GLuint positionLocation = 0;
GLuint texcoordsLocation = 1;
const char *attributeLocations[] = { "Position", "Tex" };
GLuint pbo = (GLuint)NULL;
GLuint image;

//-------------------------------
//----------CUDA STUFF-----------
//-------------------------------

int major; int minor;
int width=800; int height=800;
string yourName;

//-------------------------------
//-------------MAIN--------------
//-------------------------------

int main();

//-------------------------------
//---------RUNTIME STUFF---------
//-------------------------------

void runCuda();
void display();

//-------------------------------
//----------SETUP STUFF----------
//-------------------------------

void init();
void initPBO(GLuint* pbo);
void initCuda();
void initTextures();
void initVAO();
GLuint initShader(const char *vertexShaderPath, const char *fragmentShaderPath);

//-------------------------------
//---------CLEANUP STUFF---------
//-------------------------------

void cleanupCuda();
void deletePBO(GLuint* pbo);
void deleteTexture(GLuint* tex);
void shut_down(int return_code);

#endif