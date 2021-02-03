require 'pry'
require 'httparty'

class Api

    def self.get_zone_by_zip(zip)
        url = "https://phzmapi.org/#{zip}.json"
        response = HTTParty.get(url)
    end
    # binding.pry
end

# self.get_zone_by_zip["zone"]