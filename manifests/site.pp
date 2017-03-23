# Include hiera classes
# old: hiera_include('classes')
lookup('classes', {merge => unique}).include
