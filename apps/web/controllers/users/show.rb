module Web::Controllers::Users
  class Show
    include Web::Action
    expose :user, :events

    def call(params)
      @events = Events.new.all.select { |e| e['payload']['id'].to_i == params[:id].to_i }
      @user = UserRepository.new.find(params[:id])
    end
  end
end
