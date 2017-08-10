module Web::Views::Users
  class Show
    include Web::View

    def form
      form_for user_form, class: '' do
        text_field :name

        submit 'Update'
      end
    end


    def user_form
      Form.new(:user, routes.user_path(user.id), { user: user }, { method: :patch })
    end
  end
end
