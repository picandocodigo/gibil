# frozen_string_literal: true

require_relative 'lib/version'

Gem::Specification.new do |s|
  s.name = 'gibil'
  s.version = Gibil::VERSION
  s.summary = 'A gem to notify you of system temperature for Linux'
  s.description = 'Show a notification of your computer\'s temperature. It can be programmed' \
                  'as a cronjob, so you can be notified when the temperature is high.'
  s.authors = ['Fernando Briano']
  s.email = 'fernando@picandocodigo.net'
  s.metadata = {
    'rubygems_mfa_required' => 'true',
    'bug_tracker_uri' => 'https://github.com/picandocodigo/gibil/issues',
    'changelog_uri' => 'https://github.com/picandocodigo/gibil/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://github.com/picandocodigo/gibil/blob/master/README.md',
    'homepage_uri' => 'https://picandocodigo.net',
    'source_code_uri' => 'https://github.com/picandocodigo/gibil/',
    'funding_uri' => 'https://github.com/picandocodigo'
  }
  s.files = ['lib/gibil.rb']
  s.homepage = 'https://github.com/picandocodigo/gibil'
  s.licenses = ['GPL-3.0']
  s.required_ruby_version = '>= 3.0'
  s.executables << 'gibil'
  s.add_runtime_dependency 'libnotify'
end
