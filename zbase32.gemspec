lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zbase32/version"

Gem::Specification.new do |spec|
  spec.name          = "zbase32"
  spec.version       = Zbase32::VERSION
  spec.authors       = ["Tom de Grunt"]
  spec.email         = ["tom@degrunt.nl"]

  spec.summary       = %q{Base32 encoding designed to be easier for human use and more compact}
  spec.description   = %q{is a Base32 encoding designed to be easier for human use and more compact. It includes 1, 8 and 9 but excludes l, v and 2. It also permutes the alphabet so that the easier characters are the ones that occur more frequently. It compactly encodes bitstrings whose length in bits is not a multiple of 8, and omits trailing padding characters}
  spec.homepage      = "https://github.com/tdegrunt/zbase32"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "git@github.com:tdegrunt/zbase32.git"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
