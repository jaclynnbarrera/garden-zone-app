
class Controller

    def welcome
        puts "Welcome to Garden Zones!"
        puts "Enter your zipcode to find out what gardening zone you're in"
        self.get_zip
    end

    def get_zip
        input = gets.strip
        zone = Api.get_zone_by_zip(input).tr('^0-9', '')
        instance = Scraper.get_plants_by_zone(zone)
        self.user_prompt(instance)
    end

    def user_prompt(instance)
        puts "You are in gardening zone #{instance.zone}!"
        sleep 1
        puts "Here are 5 plants you can grow in your zone."
        sleep 1
        puts instance.veggies.keys.sample(5)
        puts "Please type the name of a plant you want to learn more about."
        sleep 1
        input = gets.strip
        self.veggie_info(input,instance)
    end

    def veggie_info(input,instance)
        results = instance.veggie_data(input)
        puts "Botanical Name: #{results[:botanical_name]}"
        sleep 1
        puts "Type of plant: #{results[:plant_type]}"
        sleep 1
        puts "Sun Exposure: #{results[:sun_exposure]}"
        self.user_options(instance)
    end

    def user_options(instance)
        puts "To see information on another plant in your zone, please enter 1"
        puts "To exit the program, please enter 2" 
        input = gets.chomp
        if input == "1"
            self.user_prompt(instance)
        elsif input == "2"
            self.exit_program
        end 
    end

    def exit_program
        abort("Thanks for using the garden zone app!")
    end
end