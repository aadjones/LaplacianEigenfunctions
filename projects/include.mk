#############################################
# include.mk – Updated build configuration  #
#############################################

# Use pkg-config to obtain FFTW and JPEG flags (if available)
FFTW_CFLAGS := $(shell pkg-config --cflags fftw3 2>/dev/null)
FFTW_LIBS   := $(shell pkg-config --libs fftw3 2>/dev/null)
JPEG_CFLAGS := $(shell pkg-config --cflags libjpeg 2>/dev/null)
JPEG_LIBS   := $(shell pkg-config --libs libjpeg 2>/dev/null)

# Optionally override these paths if needed.
XCODE_SDK_PATH ?= /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

#############################################
# Compiler and linker flags                 #
#############################################

# Compiler flags:
# (Note: Some flags remain for compatibility with older versions; adjust as needed.)
CFLAGS_COMMON = -m64 -O2 -v -c \
    -Wno-deprecated -fpermissive \
    -Wno-deprecated-declarations \
    -Wno-c++11-compat-deprecated-writable-strings \
    -Wno-reorder-init-list -Wno-implicit-int-float-conversion \
    -Wno-c99-designator -Wno-final-dtor-non-final-class \
    -Wno-extra-semi-stmt -Wno-misleading-indentation \
    -Wno-quoted-include-in-framework-header \
    -Wno-implicit-fallthrough -Wno-enum-enum-conversion \
    -Wno-enum-float-conversion -Wno-elaborated-enum-base \
    -Wno-reserved-identifier -Wno-gnu-folding-constant \
    -ferror-limit=19 \
    -flax-vector-conversions=integer \
    -fstack-check \
    -fblocks \
    -fcxx-exceptions -fexceptions \
    -fmax-type-align=16 -fcommon \
    -fcolor-diagnostics \
    -stdlib=libc++ \
    -I../../src/integrators -I../../src/linearalgebra \
    -I../../src/geometry -I../../src/util -I../../src/glvu \
    -DDO_PNG_OUT=0 \
    -I./ -I/opt/homebrew/include -I../../ -I../../src/Eigen/ \
    -I/opt/homebrew/Cellar/fftw/3.3.10_2/include \
    -I/opt/homebrew/opt/jpeg-turbo/include \
    -I/opt/homebrew/opt/libomp/include \
    $(FFTW_CFLAGS) \
    $(JPEG_CFLAGS) \
    -Xpreprocessor -fopenmp

# Linker flags:
LDFLAGS_COMMON = -framework Accelerate -framework GLUT -framework OpenGL \
    -L/usr/local/lib -lpng -lz -ljpeg -msse2 -lfftw3 -lm -flax-vector-conversions \
    -L/opt/homebrew/Cellar/fftw/3.3.10_2/lib \
    -L/opt/homebrew/lib \
    -stdlib=libc++ \
    $(FFTW_LIBS) \
    $(JPEG_LIBS) \
    -L/opt/homebrew/opt/libomp/lib -lomp

# Use clang++ to ensure that we consistently use libc++ on macOS.
COMPILER = clang++
