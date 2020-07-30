require "pry"
class API
    
    def dog_breeds
        uri = URI("https://api.thedogapi.com/v1/breeds?api_key=ead65dac-98b1-4d9c-85d5-bcb1955cbdbf")

        response = Net::HTTP.get_response(uri)

        dog_array = JSON.parse(response.body)

        dog_array.each{|name| Dogs.new(name)}

    end

    # def specific_breed(type)
    #     uri = URI("https://api.thedogapi.com/v1/breeds/search?q=#{type}")
        
    #     response = Net::HTTP.get_response(uri)

    #     code = response.code

    #     if code == "200"
    #         body = JSON.parse(response.body)

    #         puts "name = " + body.map{|x| x["name"]}.join("\n") 
    #         puts "\n"
    #         puts "life expectancy =" + body.map{|x| x["life_span"]}.join(" \n ")
    #         puts "\n"
    #         puts "Temperament =" + body.map{|x| x["temperament"]}.join("\n")

    #     else
    #         "No breeds close to that spelling found"
    #     end
    # end
end
