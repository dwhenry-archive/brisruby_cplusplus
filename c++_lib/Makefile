all: average

CPP_FLAGS=-Wno-ignored-attributes -Wall -stdlib=libstdc++ -O -Wc++11-extensions -arch i386 -arch x86_64 -std=c++11

average.o: average.cpp average.h
	g++ $(CPP_FLAGS) -c average.cpp

average: average.o
	g++ $(CPP_FLAGS) -shared average_lib.cpp -o average_lib.so average.o

clean:
	rm -rf *.so *.o
