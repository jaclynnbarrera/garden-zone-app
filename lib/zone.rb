
class Zone
    attr_accessor :zone, :veggie_hash
    
    @@all = []

    def initialize(zone,veggies={})
       @zone = zone
       @veggies = {}
       @@all << self
    end

    def self.all
        @@all
    end

    def add_veggies(veggie_hash)

    end

end