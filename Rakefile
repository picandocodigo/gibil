# frozen_string_literal: true

task default: [:test]

desc 'Test'
task :test do
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run(%w[lib test bin])
  Dir.glob('./test/**/*_test.rb').each { |file| require file }
end

desc 'Open an irb session preloaded with this library'
task :console do
  sh 'irb -r rubygems -I lib -r gibil.rb'
end
