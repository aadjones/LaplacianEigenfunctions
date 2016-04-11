LDFLAGS_COMMON = -framework Accelerate -framework GLUT -framework OpenGL -L/usr/local/lib -lpng -lz -ljpeg -msse2 -lfftw3 -lm -flax-vector-conversions /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/lib/libstdc++.dylib -L/usr/local/openmp/lib/ -liomp5 -fopenmp
CFLAGS_COMMON = -m64 -O2 -v -c -Wno-deprecated -fpermissive -Wno-deprecated-declarations -Wno-c++11-compat-deprecated-writable-strings -I../../src/integrators -I../../src/linearalgebra -I../../src/geometry -I../../src/util -I../../src/glvu -DDO_PNG_OUT=0 -I./ -I/usr/local/include -I../../ -I../../src/Eigen/ -I/usr/local/openmp/include/ -DNO_FFT -fopenmp -msse2 -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/include/c++/4.2.1/ -flax-vector-conversions

COMPILER = /usr/local/llvmbuild/Release+Asserts/bin/clang++

