require "pry"
class API
    
    def dog_breeds
        uri = URI("https://api.thedogapi.com/v1/breeds?api_key=ead65dac-98b1-4d9c-85d5-bcb1955cbdbf")

        response = Net::HTTP.get_response(uri)

        dog_array = JSON.parse(response.body)

        dog_array.each{|name| Dogs.new(name)}

    end

end
