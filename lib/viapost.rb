$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

gem 'soap4r'
require 'soap/wsdlDriver'
require 'viapost/interface'
require 'viapost/letter'

module Viapost
  VERSION = '0.0.2'
end