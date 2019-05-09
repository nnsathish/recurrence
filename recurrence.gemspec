
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "recurrence/version"

Gem::Specification.new do |spec|
  spec.name          = "recurrence"
  spec.version       = Recurrence::VERSION
  spec.authors       = ["Sathishkumar Natesan"]
  spec.email         = ["nnsathish@gmail.com"]

  spec.summary       = %q{Manage recurring events}
  spec.description   = %q{Schedule or manage various formats of recurring events}
  #spec.homepage      = "Nothing yet"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://notallowedtopush.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = ["spec"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.4.1'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
