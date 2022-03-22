lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'query_track/version'

Gem::Specification.new do |spec|
  spec.name          = 'query_track'
  spec.version       = QueryTrack::VERSION
  spec.authors       = ['Kirill Shevchenko']
  spec.email         = ['hello@kirillshevch.com']

  spec.summary       = 'Finding time-consuming database queries for ActiveRecord-based Rails Apps'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/kirillshevch/query_track'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'slack_hook'
  spec.add_dependency 'dry-configurable'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
end
