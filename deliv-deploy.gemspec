lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'deliv/deploy/version'

Gem::Specification.new do |spec|
  spec.name          = 'deliv-deploy'
  spec.version       = Deliv::Deploy::VERSION
  spec.author        = 'David Singer'
  spec.email         = 'david@ramaboo.com'

  spec.summary       = 'Puses code to OpsWorks.'
  spec.description   = 'A simple set of rake commands to automate deploys though OpsWorks.'
  spec.homepage      = 'https://github.com/deliv/deliv-deploy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'awesome_print', '~> 1.8'
  spec.add_runtime_dependency 'aws-sdk', '~> 3.0.1'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.56.0'
end
