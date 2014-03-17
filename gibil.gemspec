Gem::Specification.new do |s|
  s.name = 'gibil'
  s.version = '0.0.1'
  s.date = '2014-03-17'
  s.summary = 'A gem to notify you of system temperature'
  s.description = 'Show a notification of your computer\'s temperature. It can be programmed as a cronjob, so you can be notified when the temperature is high.'
  s.authors = ['Fernando Briano']
  s.email = 'fernando@picandocodigo.net'
  s.files = ['lib/gibil.rb']
  s.homepage = 'https://github.com/picandocodigo/gibil'
  s.licenses = ['GPL-3']
  s.executables << 'gibil'
  s.add_runtime_dependency 'libnotify'
  s.add_runtime_dependency 'whenever'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rubocop'
end
