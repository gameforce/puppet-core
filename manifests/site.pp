# Include hiera classes
# hiera version 3:
# hiera_include('classes')

# hiera version 5:
lookup('classes')
#lookup('classes', {merge => unique}).include
#include lookup('classes', { 'merge' => 'deep' })

#lookup({ 'name'  => 'classes',
#         'merge' => {
#            'strategy'          => 'deep',
#            'merge_hash_arrays' => true,
#        },
#})
