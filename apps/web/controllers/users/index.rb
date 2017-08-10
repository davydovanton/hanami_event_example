module Web::Controllers::Users
  class Index
    include Web::Action
    expose :users, :events

    def call(params)
      @events = REDIS.with { |conn| conn.lrange('hanami.event_store', 0, -1) }
      @events = @events.map { |json| JSON.parse(json) }
      @users = UserRepository.new.users.order { created_at.desc }.to_a
    end
  end
end
