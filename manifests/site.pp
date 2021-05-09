# Merge several arrays of class names into one array:
#lookup('classes', {merge => 'hash'})
#hiera_include('classes')
lookup('classes', {merge => unique}).include

filebucket { 'main':
  server => $::servername,
  path   => false,
}

File { backup => 'main' }

Package {
  allow_virtual => true,
}
