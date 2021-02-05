
class Controller

    def welcome
        puts "🪴🪴 Welcome to Garden Zones!🪴🪴".green
        sleep 1
        puts "Enter your zipcode to find out what gardening zone you're in."
        self.get_zip
    end

    def get_zip
        zip = gets.strip
        zone = Zone.find_by_zip(zip) || Api.get_zone_by_zip(zip)
        if zone == false
            puts "Please enter valid zipcode!".colorize(:green)
            self.get_zip
        elsif 
            if zone.class == String
                instance = Zone.find_by_zone(zone)
                if instance 
                    instance.add_zip(zip)
                else
                instance = Scraper.get_plants_by_zone(zone,zip)
                end
                self.user_prompt(instance)
            else 
                self.user_prompt(zone)
            end 
        end 
    end

    def user_prompt(instance)
        puts "You are in gardening zone #{instance.zone}!"
        sleep 1
        puts "Here are 5 plants you can grow in your zone."
        sleep 1
        list = instance.plants.keys.sample(5)
        list.each.with_index(1) {|item, index| puts "#{index}. #{item}"}
        puts "Please select the plant you want to learn more about (1-5)."
        input = list[(gets.strip.to_i - 1)]
        self.plant_info(input,instance)
    end

    def plant_info(input,instance)
        results = instance.plant_data(input)
        puts "Botanical Name: #{results[:botanical_name]} 👩🏻‍🌾".green
        sleep 1
        puts "Type of plant: #{results[:plant_type]} 🌱".green
        sleep 1
        puts "Sun Exposure: #{results[:sun_exposure]} 🌞".green
        sleep 1
        self.user_options(instance)
    end

    def user_options(instance)
        puts "To see information on another plant in your zone, please enter 1."
        puts "To enter different zip code, enter 2."
        puts "To exit the program, please enter 3." 
        input = gets.chomp
        if input == "1"
            self.user_prompt(instance)
        elsif input == "2"
            puts "Enter zipcode"
            self.get_zip
        elsif input == "3"
            self.exit_program
        end 
    end

    def exit_program
        abort("Thanks for using Garden Zones! 👋🏻".green)
    end
end