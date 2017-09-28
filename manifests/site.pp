# Include hiera classes
# Hiera v3:
# hiera_include('classes')

# Hiera v5:
# Merge several arrays of class names into one array:
lookup('classes', {merge => 'unique'})
