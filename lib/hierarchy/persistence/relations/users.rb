module Hierarchy
  module Persistence
    module Relations
      class Users < ROM::Relation[:sql]
        use :pagination
        schema(:users, infer: true)
      end
    end
  end
end
