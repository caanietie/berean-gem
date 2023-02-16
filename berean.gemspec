# frozen_string_literal: true

require_relative "lib/berean/version"

Gem::Specification.new do |spec|
  spec.name = "berean"
  spec.version = Berean::VERSION
  spec.author = "Clement Anietie"
  spec.email = "aakjhonclems@gmail.com"

  spec.summary = "A bible reference gem"
  spec.description = <<-DESCRIPTION
    The gem is used for handling bible references
  DESCRIPTION
  spec.homepage = "https://github.com/caanietie/berean-gem"
  spec.platform = Gem::Platform::RUBY
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    file_rgx = %r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)}
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(file_rgx)
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  # spec.test_files = spec.files.grep(%r{\Atest/}) { |f| File.basename(f) }
  spec.require_path = "lib"
  spec.post_install_message = "Plenty thanks for installing!"
end
