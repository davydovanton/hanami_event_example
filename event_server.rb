require './config/boot'

EVENTS.subscribe('user.created') do |payload|
  Interactors::UserCreate.new(payload).call
end

EVENTS.subscribe('user.updated') do |payload|
  user = UserRepository.new.update(payload['id'], name: payload['user']['name'])

  EVENTS.broadcast('notify.user_updated', id: user.id, name: user.name)
end

EVENTS.subscribe('notify.user_created') do |payload|
  puts "Send notification to user #{payload['name']}"
  puts 'DONE'
end

EVENTS.subscribe('notify.user_updated') do |payload|
  puts "User ##{payload['id']} changed name to #{payload['name']}"
  puts 'DONE'
end

loop { sleep(100) }
