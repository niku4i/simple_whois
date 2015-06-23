# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_whois/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_whois"
  spec.version       = SimpleWhois::VERSION
  spec.authors       = ["Nobuhiro Nikushi"]
  spec.email         = ["deneb.ge@gmail.com"]
  spec.description   = %q{simple whois client gem}
  spec.summary       = %q{tiny limited whois client}
  spec.homepage      = "https://github.com/niku4i/simple_whois"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.3.0"
  spec.add_development_dependency "rspec-mocks", "~> 3.3.0"
end
