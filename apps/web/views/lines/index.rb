module Web
  module Views
    module Lines
      class Index
        include Web::View

        def pagination
          raw Web::View::Helpers::Pagination.new.call('lines', pager)
        end
      end
    end
  end
end
