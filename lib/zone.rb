
class Zone
    attr_accessor :zone, :veggies, :veggie_data
    
    @@all = []

    def initialize(zone,veggies)
       @zone = zone
       @veggies = veggies
       @@all << self
    end

    def self.all
        @@all
    end

    def veggie_data(input)
        
    end

end