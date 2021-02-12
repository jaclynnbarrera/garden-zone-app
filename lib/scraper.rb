
class Scraper

  def self.get_plants_by_zone(zone)
      plants = {}
      doc = Nokogiri::HTML(open("https://www.almanac.com/plants/hardiness/#{zone}"))
      doc.css("div.views-field.views-field-title a").each do |plant| 
        plants[plant.text] = {}
      end
      Zone.new(zone,plants)
  end

  def self.get_plant_info(input)
    if input.match(" ")
      input = input.gsub(/\s+/, '-')
    end 
    plant_info = {}
    doc = Nokogiri::HTML(open("https://www.almanac.com/plant/#{input}"))

      doc.css("table.views-table.cols-9").each do |botanical|
        plant_info[:botanical_name] = botanical.css("thead th").last.text.strip
      end
      
      doc.css("table.views-table.cols-9").each do |second|
        second.css("tbody").each do |third|
            third.css("tr").each do |fourth|
                plant_info[fourth.css("th").text.strip.gsub(' ', '_').downcase.to_sym] = fourth.css("td").text.strip
            end 
        end 
    end 
    plant_info
  end 
end 