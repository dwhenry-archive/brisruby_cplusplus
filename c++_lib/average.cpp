#include "average.h"

double Averager::average(std::vector<int> vect)
{
  if (vect.size() == 0)
    return 0.0;

  double acc = 0;
  for (int x : vect)
    acc += x;
  return acc / vect.size();
}
