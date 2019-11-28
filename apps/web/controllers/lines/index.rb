module Web
  module Controllers
    module Lines
      class Index
        include Web::Action

        expose :lines

        def call(params)
          @lines = Hierarchy::Repositories[:Line].all
        end
      end
    end
  end
end
