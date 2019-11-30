require_relative 'link'

module Web
  module View
    module Helpers
      module PaginationLinks
        class FirstPageLink
          include Link

          def call(items, page)
            if page > 4
               link('1', items, 1, 'page-item') + dots
            elsif page == 4
              link('1', items, 1, 'page-item')
            else
              ''
            end
          end
        end
      end
    end
  end
end
