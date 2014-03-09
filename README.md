# Adds cronjob to notify you when the computer's temperature is high

It requires `acpi` installed on your system to get the temperature.
Clone, `bundle install` and on the project root path run:
`whenever --update-crontab`

Tested on:
  * **Ubuntu 13.04** - Unity and Cinnamon 
  * **Debian Jessie** - Gnome 3

Uses:
 * [libnotify](https://github.com/splattael/libnotify) - Ruby bindings
   for libnotify.
 * [whenever](https://github.com/javan/whenever) - Ruby gem that provides a clear syntax for writing and deploying cron jobs


## TO DO
 * Add command to call whenever for updating cron tab
 * Convert to gem (?)
