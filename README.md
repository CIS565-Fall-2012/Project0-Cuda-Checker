-------------------------------------------------------------------------------
CIS565: Homework 0: Setting up CUDA and running CUDATEST
Fall 2012
Due Tuesday, 09/18/2012
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
NOTE:
-------------------------------------------------------------------------------
This homework requires an NVIDIA graphics card with CUDA capability! Any card after the Geforce 8xxx series will work. If you do not have an NVIDIA graphics card in the machine you are working on, fell free to use any machine in the SIG Lab or in Moore100 labs. All machines in the SIG Lab and Moore100 are equipped with CUDA capable NVIDIA graphics cards. If this too proves to be a problem, please contact Patrick or Karl as soon as possible.

-------------------------------------------------------------------------------
INTRODUCTION:
-------------------------------------------------------------------------------
This homework is meant to get you started with CUDA through some simple tasks. In this homework, you will install necessary CUDA 4.2 tools and drivers needed for the class, check out a test CUDA program from Github, build, and run the test program, and check the results back into Github. None of these steps are difficult, but there is a lot to do, so let's get started!

A quick note: all of the projects for this semester will use CUDA 4.0 as their baseline, since that is the version of CUDA installed in the Moore100 labs. Versions of CUDA later than 4.0 will work too, but for Windows you may have to tweak the Visual Studio project file settings slightly.

-------------------------------------------------------------------------------
PART 1- INSTALL CUDA:
-------------------------------------------------------------------------------
WINDOWS:

* 1. Make sure you are running Windows XP/Vista/7 and that your graphics drivers are up to date. You will need support for OpenGL 3.2 or better in this class.
* 2. Make sure you have installed Visual Studio 2010 (available for free to Penn Engineering students from MSDN Academic Alliance)
* 3. Install the CUDA 4.0 (or greater) For Windows Toolkit, Development Drivers, and SDK from http://developer.nvidia.com/cuda/cuda-downloads. Make sure you download and install the appropriate versions of each package for your machine.
* 4. You're good to go! All Windows base code for CIS565 will make use of Visual Studio 2010 and will be distributed as Visual Studio 2010 projects.

OSX:

* 1. Make sure you are running OSX 10.7 or 10.8. We will need OpenGL 3.2 support in this class, so 10.7 or 10.8 are mandatory if you plan on using OSX as your development platform.
* 2. Make sure you have installed XCode 4.2 (available for free from the App Store).
* 3. Make sure you have installed the OSX Unix Command Line Development Tools (XCode->Preferences->Downloads->Command Line Tools->Install).
* 4. Install the CUDA 4.0 (or greater) For Mac Toolkit, Development Drivers, and SDK from http://developer.nvidia.com/cuda/cuda-downloads.
* 5. You're good to go! All OSX base code for CIS565 will make use of the Unix make toolchain, hence the need for OSX Unix Command Line Development Tools. 

-------------------------------------------------------------------------------
PART 2- BUILD/RUN CUDATEST:
-------------------------------------------------------------------------------
CUDATEST is a simple program that demonstrates CUDA and OpenGL functionality and interoperability on systems that CUDA has been properly installed on. If the machine you are working on has CUDA properly set up and has OpenGL 3.2 support, then when you run CUDATEST, you should see a window displaying either two horizonal colored bars OR one solid color. What gets displayed depends on your graphics card, so your results will most likely vary from some or many of your classmates. The window title should be a combination of your name and the model of your graphics card.

Please note: The Windows version of Homework 0 uses GLEW/freeglut, whereas the OSX version of Homework 0 uses GLFW. The two versions of CUDATEST are functionally the same and share the same CUDA code, but the GL harnesses for each are slightly different.

WINDOWS:

Contents:

The Windows version of CUDATEST is in the HW0_WIN/ folder. The contents of the folder are the following:

* Build/ contains CUDA 4.0 build rules. Normally the CUDA build rules do not need to be included, but the Moore100 machines have broken CUDA 4.0 rules. The ones included with the project files are fixed to work properly in Moore100.
* CUDATEST/ contains the actual source code for CUDATEST
* shared/ contains the libraries and includes for freeglut and glew

To Build:

Open CUDATEST.sln in Visual Studio 2010. The project should build straight from Visual Studio 2010 without modification.

To Run:

CUDATEST should run straight from Visual Studio 2010 without modification after building if CUDA has been installed properly on your machine.

OSX:

Contents:

The OSX version of CUDATEST is in the HW0_MAC/ folder. The contents of the folder are the following:
* bin/ is where the binary will be built to and run from.
* glfw/ contains the glfw OpenGL library's header and library files.
* shaders/ contains two simple GLSL shaders required for the OpenGL component of CUDATEST to run
* src/ contains the actual source code for CUDATEST

To Build:

The makefile for CUDATEST has already been created and set up for you. If you installed the CUDA SDK to its default location, you should be able to simply run the command "make" inside of the OSX/ folder in order to build CUDATEST. If you installed the CUDA SDK to a custom location, you will have to modify the makefile accordingly.

To Run:

Once you have successfully build CUDATEST, you can run CUDATEST by running the script run.sh in the OSX/ folder. run.sh will set up the necessary environment variables required to run CUDATEST, and then will run CUDATEST. Run.sh can be run with the command "./run.sh". You may need to run "chmod +x run.sh" beforehand, depending on how your system is set up.

-------------------------------------------------------------------------------
PART 3- MODIFY CUDATEST, RUN, SCREENSHOT, AND SUBMIT
-------------------------------------------------------------------------------

* 1. Line 15 of main.cpp contains a variable string set by default to "Your Name Here". Replace "Your Name Here" with your name, rebuild, and run CUDATEST. Take a screenshot of CUDATEST working on your machine.
* 2. ADD your screenshot to your Git repository and check in your modified main.cpp and added screenshot. 
* 3. If you are using Windows, make sure your modified CUDATEST can run in Moore100 or the SIG Lab. 
* 4. You're done with Homework 0!

