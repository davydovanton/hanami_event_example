require './config/boot'

EVENTS.subscribe('user.created') do |payload|
  Interactors::UserCreate.new(payload).call
end

EVENTS.subscribe('notify.user_created') do |payload|

  require 'debug'
  puts "Send notification to user #{payload['name']}"
end

loop { sleep(100) }
