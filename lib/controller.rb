
class Controller

    def welcome 
        puts "🪴🪴🪴🪴 Welcome to Garden Zones!🪴🪴🪴🪴".green
        sleep 1
        puts "Enter your zipcode to find out what gardening zone you're in."
        self.get_zip
    end

    def get_zip
        zip = gets.strip
        zone = Api.get_zone_by_zip(zip)      
        if zone == false 
            puts "Please enter valid zipcode!".red
            self.get_zip
        end 
        instance = Scraper.get_plants_by_zone(zone)
        user_prompt(instance)
    end

    def user_prompt(instance)
        puts "You are in gardening zone #{instance.zone}!"
        sleep 1
        puts "Here are 5 plants you can grow in your zone."
        sleep 1
        list = instance.plants.keys.sample(5)
        list.each.with_index(1) {|item, index| puts "#{index}. #{item}".green}
        puts "Please select (1-5) for the plant you want to learn more about."
        self.plant_selection(instance,list)
    end 

    def plant_selection(instance,list)
        input = gets.strip.to_i
        if input.between?(1,5)
            input = list[input-1]
            self.plant_info(input,instance)
        else
            puts "Invalid selection. Please select between 1-5.".red
            self.plant_selection(instance,list)
        end
    end

    def plant_info(input,instance)
        emojis = ["🌱", "👩🏻‍🌾", "🌼", "🌾", "🌵", "🍃", "🪴", "🌞", "🌻"]
        
        results = instance.plant_data(input)
        results.each do |key,value|
            if !results[key].empty?
            puts "#{key.to_s.gsub('_',' ').split.map(&:capitalize).join(' ')}: #{value} #{emojis.sample}".green
            sleep 0.5
            end
        end 
        self.user_options(instance)
    end

    def user_options(instance)
        puts "Enter '1', to see information on another plant in your zone."
        puts "Enter '2', to enter a different zip code."
        puts "Enter '3' to close this application."
        input = gets.chomp
        if input == "1"
            self.user_prompt(instance)
        elsif input == "2"
            puts "Enter zipcode"
            self.get_zip
        elsif input == "3"
            self.exit_program
        else 
            puts "Invalid selection.".red
            self.user_options(instance)
        end 
    end

    def exit_program
        abort("Thanks for using Garden Zones! 👋🏻".green)
    end
end