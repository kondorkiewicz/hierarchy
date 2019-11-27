require_relative 'repository'

module Hierarchy
  module Repositories
    class LineRepository < Repository[:lines]
      # associations do
      #   has_many :ascents
      #   has_many :users, through: :ascents
      # end
    end
  end
end
