
class Controller

    def welcome
        puts "Welcome to Garden Zones!"
        self.get_zip
    end

    def get_zip
        puts "Enter your zipcode to find out what gardening zone you're in."
        input = gets.strip
        Api.get_zone_by_zip(input)
        self.user_selection
    end

    def user_selection
        # puts "Your gardening zone is #{Zone.zone}"
        puts "Here are 5 veggies you can grow in your zone."
        puts "Please type the name of a vegetable you want to learn more about."
        Scraper.get_plants_by_zone
        input = gets.strip
        self.veggie_info
    end

    def veggie_info
        Scraper.get_info_on_vegetable
    end



    # def displays_zone(new_zone)
    #     puts "Your gardening zone is #{new_zone.zone}!"
    #     puts "What would you like to know? Select 1-4:
    #     1. What fruits and vegetables can I grow?
    #     input = gets.strip
    # end

    # def displays_specific_veg
        
    # end

   

    
end