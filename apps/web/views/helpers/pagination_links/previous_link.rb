module Web
  module View
    module Helpers
      module PaginationLinks
        class PreviousLink
          include Link

          def call(items, current_page, prev_page)
            link("Previous", items, prev_page, disable(current_page))
          end

          def disable(current_page)
            current_page == 1 ? 'page-item disabled' : 'page-item'
          end
        end
      end
    end
  end
end
