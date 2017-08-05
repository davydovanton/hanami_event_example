require 'hanami/interactor'

module Interactors
  class UserCreate
    include Hanami::Interactor

    def initialize(payload)
      @payload = payload
    end

    def call
      puts "Called UserCreate interactor with: #{@payload.inspect}"
    end
  end
end
