module Web
  module Controllers
    module Lines
      class Create
        include Web::Action

        expose :line

        params do
          required(:line).schema do
            required(:name).filled(:str?)
            required(:grade).filled(:str?)
            required(:kind).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            @line = Hierarchy::Repositories[:Line].create(params[:line])

            redirect_to "/lines"
          else
            self.status = 422
          end
        end
      end
    end
  end
end
