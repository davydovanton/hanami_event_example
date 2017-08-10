module Web::Controllers::Users
  class Update
    include Web::Action

    def call(params)
      redirect_to routes.user_path(params[:id])
    end
  end
end
