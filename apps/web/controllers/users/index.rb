module Web
  module Controllers
    module Users
      class Index
        include Web::Action

        expose :users, :pager

        def call(params)
          relation =
            Hierarchy::Repositories[:User]
              .users.per_page(20)
              .page(params[:page] || 1)

          @users = relation.to_a
          @pager = relation.pager
        end
      end
    end
  end
end
