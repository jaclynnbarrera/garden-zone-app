# require_relative('./config/environment')

class Scraper

    def self.get_plants_by_zone
      plants = []
      doc = Nokogiri::HTML(open("https://www.almanac.com/plants/hardiness/7"))
      doc.css("div.views-field.views-field-title a").each do |plant| 
        plants << plant.text
      end
      puts plants.sample(5)
    end


  #   def self.get_info_on_vegetable
  #     veggie_hash = {}
  #     doc = Nokogiri::HTML(open("https://www.almanac.com/plant/columbine"))
  #     doc.css("div.view-content").each do |holder|
  #       holder.css("table.views-table.cols-9").each do |column|
  #         column.
  #         column.css("th.views-field.views-field-field-botanicalname").each do |name|
  #           veggie_hash[name.text.strip] = "test"
  #           binding.pry
  #         end
  #       end 
  #     end 
  #   end
    
  # end 


  # holder.css("table.views-table.cols-9").first
  # name.css("th.views-field.views-field-field-botanicalname.views-column-odd.views-column-first.views-column-last").text ANGELICA
  # holder.css("tr.views-field.views-field-field-botanicalname.views-row.views-row-1.views-row-odd.views-row-first")
  # doc.css("div.view-content")