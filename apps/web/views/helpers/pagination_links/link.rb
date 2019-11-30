module Web
  module View
    module Helpers
      module PaginationLinks
        module Link
          include Hanami::Helpers::LinkToHelper
          include Hanami::Helpers::RoutingHelper

          private

          def link(name, items, page, klass)
            "<li class=\"#{klass}\">" +
              "#{link_to name,
                         routes.send("#{items}_path", { page: page }),
                         class: 'page-link'}" + '</li>'
          end

          def dots
            '<li class="page-item disabled"><a class="page-link">...</a></li>'
          end
        end
      end
    end
  end
end
