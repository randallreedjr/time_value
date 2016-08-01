$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'time_value/version'

Gem::Specification.new do |s|
  s.name        = 'time_value'
  s.version     = TimeValue::VERSION
  s.date        = '2016-03-27'
  s.summary     = 'Time value of money financial calculations'
  s.description = 'Perform time value of money calculations using financial calculator variables n, i, PV, PMT, and FV'
  s.authors     = ['Randall Reed, Jr.']
  s.email       = 'randallreedjr@gmail.com'
  s.required_ruby_version = '>= 2.3.0'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.files       = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  s.homepage    = 'http://rubygems.org/gems/timevalue'
  s.license     = 'MIT'
end
