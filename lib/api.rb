
class Api

    def self.get_zone_by_zip(zip)
        url = "https://phzmapi.org/#{zip}.json"
        response = HTTParty.get(url)
        zone = response["zone"]
    end

end