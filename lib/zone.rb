
class Zone
    attr_accessor :zone, :plants, :zip

    @@all = []

    def initialize(zone,plants,zip)
       @zone = zone
       @plants = plants
       @zip = [zip]
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

    def self.find_by_zip(zip)
        self.all.find do |zone|
            zone.zip.include?(zip)
        end
    end

    def add_zip(zip)
        self.zip << zip
    end
    
    def plant_data(input)
        if self.plants[input].empty?
            hash = Scraper.get_plant_info(input)
            self.plants[input.capitalize] = hash
        else
            self.plants[input]
        end
    end

end