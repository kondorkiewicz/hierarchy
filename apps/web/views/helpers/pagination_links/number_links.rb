module Web
  module View
    module Helpers
      module PaginationLinks
        class NumberLinks
          include Link

          def call(items, current_page, total_pages)
            range(current_page, total_pages).map do |page|
              link("#{page}", items, page, activate(page, current_page))
            end
          end

          private

          def range(current_page, total_pages)
            start(current_page)..finish(current_page, total_pages)
          end

          def start(page)
            page - 2 < 1 ? 1 : page - 2
          end

          def finish(page, total_pages)
            page + 2 > total_pages ? total_pages : page + 2
          end

          def activate(page, current_page)
            page == current_page ? 'page-item active' : 'page-item'
          end
        end
      end
    end
  end
end
