module Web
  module Views
    module Users
      class Index
        include Web::View

        def pagination
          raw Web::View::Helpers::Pagination.new.call('users', pager)
        end
      end
    end
  end
end
