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

      n.urgency = :normal if temp.between?(60, 79)
      n.urgency = :critical if temp > 79

      n.show!
    end
  end
end
