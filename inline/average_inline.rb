require 'inline'
require 'benchmark'

class Array

  def average_ruby
    result = 0
    self.each { |x| result += x }
    result / self.size.to_f
  end

  inline do |builder|
    builder.c_raw "
      static VALUE average_c(int argc, VALUE *argv, VALUE self) {
        double result = 0;
        long  i, len;
        VALUE *arr = RARRAY_PTR(self);
        len = RARRAY_LEN(self);

        for(i=0; i<len; i++) {
          result += NUM2DBL(arr[i]);
        }

        return rb_float_new(result/(double)len);
      }
    "
  end
end

max_loop = (ARGV.shift || 100).to_i
max_size = (ARGV.shift || 100_000).to_i
a = (1..max_size).to_a

Benchmark.bm { |x| 
  x.report(" pure ruby: ") { 1.upto(max_loop) { avg = a.average_ruby } }
  x.report("inline c++: ") { 1.upto(max_loop) { avg = a.average_c } }
}
