Gem::Specification.new do |s|
  s.name = 'gibil'
  s.version = '0.1.1'
  s.date = '2014-04-10'
  s.summary = 'A gem to notify you of system temperature for Linux'
  s.description = 'Show a notification of your computer\'s temperature. It can be programmed as a cronjob, so you can be notified when the temperature is high.'
  s.authors = ['Fernando Briano']
  s.email = 'fernando@picandocodigo.net'
  s.files = ['lib/gibil.rb']
  s.homepage = 'https://github.com/picandocodigo/gibil'
  s.licenses = ['GPL-3.0']
  s.executables << 'gibil'
  s.add_runtime_dependency 'libnotify'
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'minitest', '~> 5.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubocop'
end
