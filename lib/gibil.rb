# frozen_string_literal: true

require 'libnotify'
require 'find'

module Gibil
  # Temperature Sensor interface.
  # Currently works/tested only on Linux
  module Sensor
    # == Returns:
    # A float value of the system's temperature
    def self.temperature
      Find.find('/sys/class/hwmon/') do |path|
        Dir["#{path}/*"].select do |file|
          return File.read(file).to_f / 1000 if file.match?(/temp[0-9]+_input/)
        end
      end
      raise "couldn't read temperature"
    end
  end

  # Uses system notification to notify of current temperature.
  # Currently works/tested only on Linux
  module Notification
    def self.notify
      temp = Sensor.temperature

      n = Libnotify.new(
        summary: 'Temperature',
        body: "Your computer's temperature is now #{temp} °C",
        timeout: 1.5,
        append: true
      )

      n.urgency = temp > 80 ? :critical : :normal

      n.show!
    end
  end

  # Module to write the cronjob
  module Cronify
    # Tries to write the crontab and exits with the appropiate code
    def self.schedule
      cron = <<-CRON.gsub(/^ {8}/, '')
        # Gibil temperature notification
        0,10,20,30,40,50 * * * * /bin/bash -l -c 'gibil job'
        # End Gibil temperature notification
      CRON

      require 'tempfile'
      file = Tempfile.new('temp_cronfile')
      file.write(cron)
      file.close

      run(file)
    end

    def self.run(file)
      if system("crontab #{file.path}")
        puts 'INFO: Wrote crontab file'
        file.unlink
        exit(0)
      else
        warn 'ERROR: Failed to write crontab'
        file.unlink
        exit(1)
      end
    end
  end
end
