module Hierarchy
  module Persistence
    module Relations
      class Lines < ROM::Relation[:sql]
        use :pagination
        schema(:lines, infer: true)
      end
    end
  end
end
