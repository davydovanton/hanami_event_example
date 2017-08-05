module Web::Controllers::Users
  class Create
    include Web::Action

    def call(params)
      EVENTS.broadcast('user.created', params[:user])
      redirect_to routes.root_path
    end
  end
end
