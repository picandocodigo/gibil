# -*- coding: utf-8 -*-
require 'libnotify'

module Notification

  def self.notify(temp)
    temp = temp.to_f
    n = Libnotify.new(
                      :summary => "Temperature",
                      :body => "The temperature of your computer is now #{temp} °C",
                      :timeout => 1.5,
                      :append => true,
                      )

    if temp.between?(60,79) then n.urgency = :normal end

    if temp > 79 then n.urgency = :critical end

    n.show! unless temp < 60
  end
  
end
