#define DLLEXPORT extern "C" __declspec(dllexport)
#include "average.h"

DLLEXPORT double average(int* arr, int size)
{
  std::vector<int> vect(size);
  for (int i=0; i<size; ++i)
    vect.at(i) = arr[i];
  return Averager::average(vect);
}


