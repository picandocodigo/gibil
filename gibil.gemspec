Gem::Specification.new do |s|
  s.name = 'gibil'
  s.version = '0.1.0'
  s.date = '2014-04-10'
  s.summary = 'A gem to notify you of system temperature'
  s.description = 'Show a notification of your computer\'s temperature. It can be programmed as a cronjob, so you can be notified when the temperature is high.'
  s.authors = ['Fernando Briano']
  s.email = 'fernando@picandocodigo.net'
  s.files = ['lib/gibil.rb']
  s.homepage = 'https://github.com/picandocodigo/gibil'
  s.licenses = ['GPL-3']
  s.executables << 'gibil'
  s.add_runtime_dependency 'libnotify', '~> 0.8'
  s.add_development_dependency 'minitest', '~> 5.3'
  s.add_development_dependency 'rubocop', '~> 0.19'
end
