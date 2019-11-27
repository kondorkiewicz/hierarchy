module Hierarchy
  module Persistence
    module Relations
      class Ascents < ROM::Relation[:sql]
        schema(:ascents, infer: true)
      end
    end
  end
end
