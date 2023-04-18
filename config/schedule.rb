set :output, "#{path}/log/cron.log"

every 1.day, at: ['10:00 am', '1:00 pm', '3:00 pm' ] do
  runner "Status.update_status"
end
