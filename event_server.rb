require './config/boot'

EVENTS.subscribe('user.created') do |payload|
  Interactors::UserCreate.new(payload).call
end

EVENTS.subscribe('notify.user_created') do |payload|
  puts "Send notification to user #{payload['name']}"
  puts 'DONE'
end

loop { sleep(100) }
