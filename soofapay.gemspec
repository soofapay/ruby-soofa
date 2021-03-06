
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "soofapay/version"

Gem::Specification.new do |spec|
  spec.name          = "soofapay"
  spec.version       = Soofapay::VERSION
  spec.authors       = ["soofapay team"]
  spec.email         = ["info@soofapay.com"]
  spec.summary       = %q{ SoofaPay intergartion library}
  spec.description   = %q{ User Helper}
  spec.homepage      = "https://github.com/soofapay/ruby-soofa"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'json', '~> 1.8', '>= 1.8.3'
  spec.add_development_dependency 'url', '~> 0.3.2'
  spec.add_development_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
end
