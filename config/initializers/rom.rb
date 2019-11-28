require 'rom'

module Hierarchy
  module Persistence
    def self.db
      @rom ||= ROM.container(configuration)
    end

    def self.relations
      db.relations
    end

    def self.configuration
      @configuration ||= ROM::Configuration.new(:sql, ENV.fetch('DATABASE_URL')).tap do |config|
        config.auto_registration(Hanami.root.join('lib/hierarchy/persistence'), namespace: 'Hierarchy::Persistence')
      end
    end
  end
end
