# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'haasu-sutoon-data/version'

Gem::Specification.new do |spec|
  spec.name          = "haasu-sutoon-data"
  spec.version       = HaasuSutoonData::VERSION
  spec.authors       = ["Yuya TAMANO"]
  spec.email         = ["everfree.main@gmail.com"]

  spec.summary       = 'tool to generate English-Japanese card dictionary from Hearthstonejson.com'
  spec.description   = 'See README.md for more information.'
  spec.homepage      = 'https://github.com/tamano/haasu-sutoon-data'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    # raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
