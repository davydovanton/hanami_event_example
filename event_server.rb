require './config/boot'

EVENTS.subscribe('user.created') do |payload|
  Interactors::UserCreate.new(payload).call
end

loop { sleep(100) }
