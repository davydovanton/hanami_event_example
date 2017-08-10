module Web::Controllers::Users
  class Update
    include Web::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
