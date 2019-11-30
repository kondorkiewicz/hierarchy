module Web
  module View
    module Helpers
      class Pagination
        def call(items, pager)
          pagination(items, pager).flatten.reduce("", :+)
        end

        private

        def pagination(items, pager)
          [
            '<nav aria-label="..."><ul class="pagination">',
            PaginationLinks::PreviousLink.new.call(items, pager.current_page, pager.prev_page),
            PaginationLinks::FirstPageLink.new.call(items, pager.current_page),
            PaginationLinks::NumberLinks.new.call(items, pager.current_page, pager.total_pages),
            PaginationLinks::LastPageLink.new.call(items, pager.current_page, pager.total_pages),
            PaginationLinks::NextLink.new.call(
              items, pager.current_page, pager.next_page, pager.total_pages
            ),
            '</ul></nav>'
          ]
        end
      end
    end
  end
end
