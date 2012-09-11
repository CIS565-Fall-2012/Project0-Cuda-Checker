NVCC     = /usr/local/cuda/bin/nvcc -m64
CC       = /usr/bin/gcc -m64

GLFW_INCLUDE_PATH = -Iglfw/include/ 
GLFW_LIB_PATH = -Lglfw/lib/
GLFW = $(GLFW_INCLUDE_PATH) $(GLFW_LIB_PATH)

CUDA_INCLUDE = -I/usr/local/cuda/include  
CUDASDK_C_LIB_PATH = -L/Developer/GPU\ Computing/C/lib
CUDASDK_C_INCLUDE_PATH = -I/Developer/GPU\ Computing/C/common/inc
CUDA = $(CUDA_INCLUDE) $(CUDASDK_C_LIB_PATH) $(CUDASDK_C_INCLUDE_PATH) 

XLINKER = -Xlinker -framework,OpenGL,-framework,GLUT

LFLAGS = $(GLFW) $(CUDA) $(XLINKER) -lglfw 

all: CUDATEST

CUDATEST: src/main.cpp
	$(NVCC) $(GLEW_PATH) $(LFLAGS) src/main.cpp src/kernel.cu src/glslUtility.cpp -o bin/CUDATEST

clean:
	rm bin/CUDATEST
	rm *.o

.PHONY : bin/CUDATEST