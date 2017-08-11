module Web::Controllers::Users
  class Index
    include Web::Action
    expose :users, :events

    def call(params)
      @events = REDIS.with { |conn| conn.lrange('hanami.event_store', 0, -1) }.map! { |json| JSON.parse(json) }
      @events = @events.select { |e| e['event_name'][/created/] }
      @users = UserRepository.new.users.order { created_at.desc }.to_a
    end
  end
end
