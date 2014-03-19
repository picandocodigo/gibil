# -*- coding: utf-8 -*-
require 'libnotify'

module Gibil
  # Temperature Sensor interface.
  # Currently works/tested only on Linux
  module Sensor
    # == Returns:
    # A float value of the system's temperature
    def self.temperature
      `cat /sys/class/hwmon/hwmon0/temp1_input`.to_f / 1000
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

      n.urgency = (temp > 80) ? :critical : :normal

      n.show!
    end
  end

  # Module to write the cronjob
  module Cronify
    # Tries to write the crontab and exits with the appropiate code
    def self.schedule
      cron = <<-END.gsub(/^ {8}/, '')
        # Gibil temperature notification
        0,10,20,30,40,50 * * * * /bin/bash -l -c 'gibil job'
        # End Gibil temperature notification
      END

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

    def self.temp_path(cron)
      file.path
    end
  end
end
