module Web::Views::Users
  class Index
    include Web::View

    def form
      form_for :user, routes.users_path do
        text_field :name

        submit 'Create'
      end
    end
  end
end
