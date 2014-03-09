task default: [:check]

task :check do
  require_relative './notification'
  temp = `acpi -t | awk \'{print $4}\'`
  Notification.notify(temp)
end
