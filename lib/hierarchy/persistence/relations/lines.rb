module Hierarchy
  module Persistence
    module Relations
      class Lines < ROM::Relation[:sql]
        schema(:lines, infer: true)
      end
    end
  end
end
