module Web
  module View
    module Helpers
      module PaginationLinks
        class NextLink
          include Link

          def call(items, current_page, next_page, total_pages)
            link("Next", items, next_page, disable(current_page, total_pages))
          end

          private

          def disable(current_page, total_pages)
            current_page == total_pages ? 'page-item disabled' : 'page-item'
          end
        end
      end
    end
  end
end
