module Web::Controllers::Users
  class Show
    include Web::Action
    expose :user, :events

    def call(params)
      @events = REDIS.with { |conn| conn.lrange('hanami.event_store', 0, -1) }.map! { |json| JSON.parse(json) }
      @events = @events.select { |e| e['payload']['id'].to_i == params[:id].to_i }
      @user = UserRepository.new.find(params[:id])
    end
  end
end
