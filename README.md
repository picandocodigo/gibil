# Gibil
[![Code Climate](https://codeclimate.com/github/picandocodigo/gibil.png)](https://codeclimate.com/github/picandocodigo/gibil)
[![Gem Version](https://badge.fury.io/rb/gibil.svg)](http://badge.fury.io/rb/gibil)

> Gibil in Sumerian mythology is the god of fire

A gem to notify you of your computer's temperature using the system's notifications.

```bash
$ gem install gibil
$ gibil          # Will notify you of your computer's temperature
$ gibil schedule # Will add a crontab for notifying you when the
                 # computer's temperature is too high
```

Tested on:
  * **Ubuntu 19.10** - GNOME 3
  * **Ubuntu 13.04** - Unity and Cinnamon
  * **Debian Jessie** - GNOME 3

Uses:
 * [libnotify](https://github.com/splattael/libnotify) - Ruby bindings
   for libnotify.
