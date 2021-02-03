
class Controller

    def welcome
        puts "Welcome to Garden Zones!"
        self.get_zip
    end

    def get_zip
        puts "Enter your zipcode to find out what gardening zone you're in."
        input = gets.strip
        new_zone = Api.get_zone_by_zip(input)
        self.displays_zone(new_zone)
    end

    def displays_zone(new_zone)
        puts "Your gardening zone is #{new_zone.zone}!"
        puts "What would you like to know? Select 1-4:
        1. Temperature / Frost Dates
        2. What fruits can I grow?
        3. What veggie can I grow?
        4. Gardening tips for my zone"
        input = gets.strip
    end

    
end