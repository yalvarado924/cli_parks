class Campground

    @@all = []

    attr_accessor :name, :description

    def initialize(name, description)
        @name = name
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

end