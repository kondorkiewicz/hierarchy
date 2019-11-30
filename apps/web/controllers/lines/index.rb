module Web
  module Controllers
    module Lines
      class Index
        include Web::Action

        expose :lines, :pager

        def call(params)
            relation = Hierarchy::Repositories[:Line]
              .lines.per_page(20)
              .page(params[:page] || 1)

          @lines = relation.to_a
          @pager = relation.pager
        end
      end
    end
  end
end
