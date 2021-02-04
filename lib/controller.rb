
class Controller

    def welcome
        puts "Welcome to Garden Zones!"
        self.get_zip
    end

    def get_zip
        puts "Enter your zipcode to find out what gardening zone you're in."
        input = gets.strip
        zone = Api.get_zone_by_zip(input).tr('^0-9', '')
        self.user_prompt(zone)
    end

    def user_prompt(zone)
        instance = Scraper.get_plants_by_zone(zone)
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
        puts "Type of plant: #{results[:plant_type]}"
        puts "Sun Exposure: #{results[:sun_exposure]}"
        puts "Would you like to select another plant?"
        input = gets.strip
    end

    def user_prompt_two
        puts "Would you like to select another plant?"
    end
end