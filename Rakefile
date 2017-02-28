task default: [:test]

task :test do
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run(%w(lib test bin))
  Dir.glob('./test/**/*_test.rb').each { |file| require file}
end
