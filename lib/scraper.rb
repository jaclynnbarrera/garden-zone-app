# require_relative('./config/environment')

class Scraper

  def self.get_plants_by_zone(zone)
      veggies = []
      doc = Nokogiri::HTML(open("https://www.almanac.com/plants/hardiness/#{zone}"))
      doc.css("div.views-field.views-field-title a").each do |veggie| 
        veggies << veggie.text
      end
      Zone.new(zone,veggies)
      puts veggies.sample(5)
  end


  #   def self.scrape_veggie_page(input)
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
  end 