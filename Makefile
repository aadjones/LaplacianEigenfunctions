SHELL := /bin/bash -e

BINS = laplacianEigen2D laplacianEigen3D laplacianEigenFFTW2D 

SRCS = geometry linearalgebra integrators util glvu

all : 
	-for d in $(BINS); do (echo -e "\n==== Entering $$d ====\n";cd ./projects/$$d; make -f Makefile;cd ../..); done

regressionTest: 
	-for d in $(BINS); do (echo -e "\n==== Entering $$d ====\n";cd ./projects/$$d; make -f Makefile.osx regression;cd ../..); done

clean: 
	-for d in $(BINS); do (echo -e "\n==== Cleaning $$d ====\n";cd ./projects/$$d; make -f Makefile clean;cd ../..); done 
	-for d in $(SRCS); do (echo -e "\n==== Cleaning $$d ====\n";cd ./src/$$d; rm -f *.o; cd ../..); done

objclean:
	-for d in $(SRCS); do (echo -e "\n==== Cleaning $$d ====\n";cd ./src/$$d; rm -f *.o; cd ../..); done

ctags:
	ctags -R *
