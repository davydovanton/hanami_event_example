module Web::Controllers::Users
  class Show
    include Web::Action
    expose :user, :events

    def call(params)
      @events = REDIS.with { |conn| conn.lrange('hanami.event_store', 0, -1) }
      @events = @events.map { |json| JSON.parse(json) }
      @user = UserRepository.new.find(params[:id])
    end
  end
end
