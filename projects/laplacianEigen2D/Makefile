include ../include.mk

# calls:
CC         = ${COMPILER}
CFLAGS     = -Wno-deprecated-declarations ${CFLAGS_COMMON} 
LDFLAGS    = ${LDFLAGS_COMMON} 
EXECUTABLE = ../../bin/laplacianEigen2D

SOURCES    = laplacianEigen2D.cpp \
						 ../../src/glvu/glvu.cpp \
						 ../../src/util/TIMER.cpp \
						 ../../src/util/SIMPLE_PARSER.cpp \
						 ../../src/linearalgebra/SPARSE_MATRIX.cpp \
						 ../../src/linearalgebra/VECTOR.cpp \
						 ../../src/linearalgebra/MATRIX.cpp \
						 ../../src/linearalgebra/MATRIX3.cpp \
						 ../../src/linearalgebra/TENSOR3.cpp \
						 ../../src/geometry/FIELD_3D.cpp \
						 ../../src/geometry/VECTOR3_FIELD_3D.cpp \
						 ../../src/integrators/FLUID_3D_MIC.cpp \
						 ../../src/geometry/FIELD_2D.cpp \
						 ../../src/geometry/VECTOR3_FIELD_2D.cpp \
						 ../../src/util/MIN_HEAP.cpp \

OBJECTS    = $(SOURCES:.cpp=.o)

all: $(SOURCES) $(EXECUTABLE)
	
$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o
