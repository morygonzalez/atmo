# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'atmo/version'

Gem::Specification.new do |spec|
  spec.name          = "atmo"
  spec.version       = Atmo::VERSION
  spec.authors       = ["森井ゴンザレス"]
  spec.email         = ["morygonzalez@gmail.com"]

  spec.summary       = %q{Netatmo Weather Station Client for Ruby.}
  spec.description   = %q{Very tiny Netatmo Weather Station client for Ruby.}
  spec.homepage      = "https://github.com/morygonzalez/atmo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "pry", "~> 0.13.0"
  spec.add_runtime_dependency "json", "~> 2.3"
  spec.add_runtime_dependency "dotenv", "~> 2.7"
  spec.add_runtime_dependency "faraday", "~> 1.0"
end
