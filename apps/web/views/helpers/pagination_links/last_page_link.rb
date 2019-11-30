require_relative 'link'

module Web
  module View
    module Helpers
      module PaginationLinks
        class LastPageLink
          include Link

          def call(items, page, total_pages)
            if page + 3 < total_pages
              dots + link("#{total_pages}", items, total_pages, 'page-item')
            elsif page + 3 == total_pages
              link("#{total_pages}", items, total_pages, 'page-item')
            else
              ''
            end
          end
        end
      end
    end
  end
end
