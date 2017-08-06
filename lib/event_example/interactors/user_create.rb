require 'hanami/interactor'

module Interactors
  class UserCreate
    include Hanami::Interactor

    def initialize(payload)
      @payload = Hanami::Utils::Hash.symbolize(payload)
    end

    def call
      puts '*' * 80
      puts "\tLong calculation"
      sleep 1
      user = UserRepository.new.create(@payload)
      puts "\tNew user: #{user.inspect}"
      puts '*' * 80

      EVENTS.broadcast('notify.user_created', name: user.name)
    end
  end
end
