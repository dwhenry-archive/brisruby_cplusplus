$: << '.'
require 'mytest'
include MyTest # Note this is actually required... weird huh?

p MyTest.sum(3,4)
