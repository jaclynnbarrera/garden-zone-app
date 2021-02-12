
class Zone
    attr_accessor :zone, :plants

    @@all = []

    def initialize(zone,plants)
       @zone = zone
       @plants = plants
       @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_zone(zone)
        self.all.find do |zone|
            zone.zone == zone
        end 
    end

    def plant_data(input)
        if self.plants[input].empty?
            self.plants[input] = Scraper.get_plant_info(input)
        else
            self.plants[input]
        end
    end
end