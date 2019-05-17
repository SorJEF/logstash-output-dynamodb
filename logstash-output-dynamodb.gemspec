# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'logstash-output-dynamodb'
  s.version       = '0.1.0'
  s.licenses      = ['Apache-2.0']
  s.summary       = 'Logstash output plugin for DynamoDB'
  s.description   = 'Logstash output plugin for AWS DynamoDB'
  s.homepage      = 'https://github.com/sorjef/logstash-output-dynamodb'
  s.authors       = ['Jason Pilz', 'Artem Sorokin']
  s.email         = 'sorokinjef@gmail.com'
  s.require_paths = ['lib']

  s.files = Dir[*%w[lib/**/* spec/**/* vendor/**/* *.gemspec *.md CONTRIBUTORS Gemfile LICENSE NOTICE.TXT]]
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.metadata = { 'logstash_plugin' => 'true', 'logstash_group' => 'output' }

  s.add_runtime_dependency 'logstash-codec-plain'
  s.add_runtime_dependency 'logstash-core-plugin-api', '~> 2.0'
  s.add_runtime_dependency 'logstash-mixin-aws', '>= 4.3.0'

  s.add_development_dependency 'logstash-devutils'
end
