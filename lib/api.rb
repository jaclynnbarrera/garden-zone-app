
class Api

    def self.get_zone_by_zip(zip)
        url = "https://phzmapi.org/#{zip}.json"
        response = HTTParty.get(url)
        if response.has_key?("Error")
          return false
        end 
        response["zone"].tr('^0-9', '')
    end

end