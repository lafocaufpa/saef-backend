# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
env :PATH, ENV['PATH']
set :output, "log/cron.log"
#

every :friday, at: '16:50' do
  runner "SendEmailReminderService.send_attendance_reminder"
end