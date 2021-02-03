
class Zone
    attr_accessor :zone, :temp_range

    @@all = []

    def initialize(response)
        @zone = response["zone"]
        @temp_range = response["temperature_range"]
        @@all << self
    end

    def self.all
        @@all
    end

    def display_zone
        self.all
        binding.pry
    end

end




