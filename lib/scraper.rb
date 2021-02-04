
class Scraper

  def self.get_plants_by_zone(zone)
    
      veggies = {}
      doc = Nokogiri::HTML(open("https://www.almanac.com/plants/hardiness/#{zone}"))
      doc.css("div.views-field.views-field-title a").each do |veggie| 
        veggies[veggie.text] = {}
      end
      Zone.new(zone,veggies)
  end

  def self.get_veggie_info(input)
    values = []
    veggie_hash = {}
    doc = Nokogiri::HTML(open("https://www.almanac.com/plant/#{input}"))
      doc.css("div.block-content").each do |second|
        second.css("div.view-content").each do |third|
          values << third.css("em").text
        end
      end 

    doc.css("div.block-content").each do |second|
      second.css("div.view-content").each do |third|
        third.css("a").each do |value|
          values << value.text
        end
      end
    end  

    values.shift
    veggie_hash[:botanical_name] = values[0]
    veggie_hash[:plant_type] = values[1]
    values.each do |value|
      if value.include?("Sun")
        veggie_hash[:sun_exposure] = value
      end 
    end 
    veggie_hash
  end 
end 