
class Api

    def self.get_zone_by_zip(zip)
        url = "https://phzmapi.org/#{zip}.json"
        response = HTTParty.get(url)
        Zone.new(response)
    end

end