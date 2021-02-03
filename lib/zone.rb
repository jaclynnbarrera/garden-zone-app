
class Zone
    attr_accessor :zone, :veggies
    

    @@all = []

    def initialize(zone,veggies)
       @zone = zone
       @veggies = veggies
       @@all << self
       binding.pry
    end

    def self.add_veggies

    end

    def self.all
        @@all
    end

    def display_veggies
        
    end

    def display_zone
    end

end

