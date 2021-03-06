# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backup_upyun/version'

Gem::Specification.new do |spec|
  spec.name          = "backup_upyun"
  spec.version       = BackupUpyun::VERSION
  spec.authors       = ["Halsey"]
  spec.email         = ["halsey@whosv.com"]
  spec.summary       = %q{Upyun Storage support for Backup}
  spec.description   = %q{Upyun Storage support for Backup}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "backup", "~> 4.1"
  spec.add_dependency "rest-client", "~> 1.7"
  
	spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
end
