module Web
  module Controllers
    module Users
      class Index
        include Web::Action

        expose :users

        def call(params)
          @users = Hierarchy::Repositories[:User].all
        end
      end
    end
  end
end
