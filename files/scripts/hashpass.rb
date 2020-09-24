#!/usr/bin/env ruby
# Script to generate hash with SHA512 as required for macOS 10.7+

require 'openssl'

password   = 'somepassword'
salt       = OpenSSL::Random.random_bytes(32)
iterations = 40_000
digest     = OpenSSL::Digest::SHA512.new
hash       = OpenSSL::PKCS5.pbkdf2_hmac(password, salt, iterations, 128, digest)

puts "password   => '#{hash.unpack('H*').first}',"
puts "salt       => '#{salt.unpack('H*').first}',"
puts "iterations => #{iterations}"
