Gem::Specification.new do |s|
	s.name				= 'time_value'
	s.version			= '0.1.0'
	s.date				= '2016-03-27'
	s.summary			= "Time value of money financial calculations"
	s.description = "Perform time value of money calculations using financial calculator variables n, i, PV, PMT, and FV"
	s.authors 		= ["Randall Reed, Jr."]
	s.email 			= 'randallreedjr@gmail.com'
  s.add_development_dependency "rspec", '~> 3.2'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
	s.homepage 		= 'http://rubygems.org/gems/timevalue'
	s.license 		= 'MIT'
end
