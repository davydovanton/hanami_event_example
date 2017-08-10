module Web::Controllers::Users
  class Update
    include Web::Action

    params do
      required(:user).schema do
        required(:name).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        EVENTS.broadcast('user.updated', id: params[:id], user: params[:user])
      else
        flash[:error] = 'Invalid user'
      end

      redirect_to routes.user_path(params[:id])
    end
  end
end
