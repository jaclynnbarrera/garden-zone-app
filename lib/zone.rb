
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

    #checks if zone object exists
    def self.find_by_zone(input)
        self.all.find do |zone|
            zone.zone == input
        end 
    end
    
    #checks if veggie hash in object exists
    def veggie_data(input)
        if self.veggies[input].empty?
            hash = Scraper.get_veggie_info(input)
            self.veggies[input.capitalize] = hash
        else
            self.veggies[input]
        end
    end
end