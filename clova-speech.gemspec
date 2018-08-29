
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "clova/version"

Gem::Specification.new do |spec|
  spec.name          = "clova-speech"
  spec.version       = Clova::VERSION
  spec.authors       = ["Isaiah Bush"]
  spec.email         = ["itbush@cs.stanford.com, itbush2016@gmail.com"]

  spec.summary       = "SDK of the LINE Clova Smart Speaker"
  spec.description   = "Clova API - SDK of the LINE Clova Smart Speaker API for Ruby. Developed as part of an internship at LINE Corp"
  spec.homepage      = "https://github.com/itbush/clova-speech"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = %w(README.md) + Dir['lib/**/*.rb']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "openssl", "~> 2.1"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
