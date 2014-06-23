# my_library.rb
require 'ffi'
require 'ffi/libc'

module MyLibrary
  extend FFI::Library
  ffi_lib "../c++_lib/average_lib.so"
  attach_function :average, [:pointer, :int], :double

  def self.avg(numbers)
    numbers_arr = FFI::LibC.malloc(FFI.type_size(FFI::Type::INT) * numbers.size)
    numbers_arr.write_array_of_int(numbers)
    average(numbers_arr, numbers.size)
  end
end

puts MyLibrary::avg([1,2,3,4])
