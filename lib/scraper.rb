
class Scraper

  def self.get_plants_by_zone(zone,zip)
      plants = {}
      doc = Nokogiri::HTML(open("https://www.almanac.com/plants/hardiness/#{zone}"))
      doc.css("div.views-field.views-field-title a").each do |plant| 
        plants[plant.text] = {}
      end
      Zone.new(zone,plants,zip)
  end

  def self.get_plant_info(input)
    if input.match(" ")
      input = input.gsub(/\s+/, '-')
    end 
    values = []
    veggie_hash = {}
    doc = Nokogiri::HTML(open("https://www.almanac.com/plant/lilies"))

      doc.css("table.views-table.cols-9").each do |botanical|
        veggie_hash[:botanical_name] = botanical.css("thead th").last.text.strip
      end
      doc.css("div.block-content").each do |second|
        second.css("div.view-content").each do |third|
          third.css("a").each do |value|
            values << value.text
          end
        end
      end  
    veggie_hash[:plant_type] = values[0]
    values.each do |value|
      if value.include?("Sun")
        veggie_hash[:sun_exposure] = value
      end 
    end 
    veggie_hash
  end 
end 