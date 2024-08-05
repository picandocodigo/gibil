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
      if File.file?('/sys/class/hwmon/')
        hwmon
      elsif !Dir.glob('/sys/class/thermal/thermal_zone*/temp').empty? &&
            (files = Dir.glob('/sys/class/thermal/thermal_zone*/temp'))
        thermal(files)
      else
        0
      end
    end

    def self.hwmon
      Find.find('/sys/class/hwmon/') do |path|
        Dir["#{path}/*"].select do |file|
          return File.read(file).to_f / 1000 if file.match?(/temp[0-9]+_input/)
        end
      end
    end

    def self.thermal(files)
      total = 0
      files.each do |t|
        n = t.match(/[0-9]+/)[0]
        tipo = File.read("/sys/class/thermal/thermal_zone#{n}/type").strip
        temp = File.read(t).to_i / 1000
        puts "#{tipo}: #{temp}°C"
        total += temp
      end
      total / files.count
    end
  end

  # Uses system notification to notify of current temperature.
  # Currently works/tested only on Linux
  module Notification
    def self.notify
      temp = Sensor.temperature

      n = Libnotify.new(
        summary: 'Temperature',
        body: message(temp),
        timeout: 3.0,
        append: true
      )

      n.urgency = temp > 80 ? :critical : :normal
      n.show!
    end

    def self.message(temp)
      if temp.positive?
        "Your computer's temperature is ~#{temp} °C"
      else
        'Couldn\'t read the computer\'s temperature.'
      end
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
