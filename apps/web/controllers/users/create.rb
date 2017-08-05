module Web::Controllers::Users
  class Create
    include Web::Action

    def call(params)
      redirect_to routes.users_path
    end
  end
end
