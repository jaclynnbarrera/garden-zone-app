
class Zone
    attr_accessor :zone, :veggies
    
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
        hash = Scraper.get_veggie_info(input)
        veggies[input.capitalize] = hash
    end

end