// Include the Ruby headers and goodies
#include "ruby.h"

// Defining a space for information and references about the module to be stored internally
VALUE MyTest = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_mytest();

// Prototype for our method 'test1' - methods are prefixed by 'method_' here
VALUE method_sum(VALUE self, VALUE x, VALUE y);

// The initialization method for this module
void Init_mytest() {
	MyTest = rb_define_module("MyTest");
  rb_define_singleton_method(MyTest, "sum", method_sum, 2);
}

VALUE method_sum(VALUE self, VALUE x, VALUE y) {
  return INT2NUM(NUM2INT(x) + NUM2INT(y));
}
