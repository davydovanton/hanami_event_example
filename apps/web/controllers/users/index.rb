module Web::Controllers::Users
  class Index
    include Web::Action
    expose :users, :events

    def call(params)
      @events = Events.new.all.select { |e| e['event_name'][/created/] }
      @users = UserRepository.new.users.order { created_at.desc }.to_a
    end
  end
end
