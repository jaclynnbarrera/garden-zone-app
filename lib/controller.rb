
class Controller

    def welcome
        puts "Welcome to Garden Zones!"
        self.get_zip
    end

    def get_zip
        puts "Enter your zipcode to find out what gardening zone you're in."
        input = gets.strip
        zone = Api.get_zone_by_zip(input).tr('^0-9', '')
        self.user_selection(zone)
    end

    def user_selection(zone)
        puts "Your gardening zone is #{zone}!"
        sleep 1
        puts "Here are 5 veggies you can grow in your zone."
        sleep 1
        puts "Please type the name of a vegetable you want to learn more about."
        sleep 1
        Scraper.get_plants_by_zone(zone)
        input = gets.strip
        self.veggie_info(input)
    end

    def veggie_info(input)


        # Scraper.get_info_on_vegetable
    end
    
end