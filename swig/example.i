/* example.i */
%include "std_vector.i"
namespace std {
  %template(IntVector) vector<int>;
}

%module example
%{
#include "../c++_lib/average.h"
%}

/* Parse the header file to generate wrappers */
%include "../c++_lib/average.h"
