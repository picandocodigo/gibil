task default: [:test]

task :temperature do
  require_relative './lib/gibil'
  Gibil::Notification.notify if Gibil::Sensor.temperature > 60
end

task :test do
  require 'rubocop'
  cli = Rubocop::CLI.new
  cli.run(%w(lib test))
  Dir.glob('./test/**/*_test.rb').each { |file| require file}
end
