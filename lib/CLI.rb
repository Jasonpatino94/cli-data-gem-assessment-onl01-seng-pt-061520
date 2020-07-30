require 'pry'
class CLI
   
    def run
      @api = API.new
      @api.dog_breeds
      system("clear")
       puts "LETS LEARN ABOUT SPECIFIC DOG BREEDS!!"
       puts "\n"
       menu
    end

    def menu
      puts "1) All Dog Breeds!"
      puts "2) Exit"
      puts "Which would you like to choose?"
      input = gets.chomp.downcase
         if input == "1" 
            all_dog_breeds
         elsif input == "2"
           goodbye
         else
            run
            puts "Invalid Input. Try again"
         end
     end

     def all_dog_breeds
         Dogs.all.each_with_index do |dog, index|
            puts "#{index + 1}. #{dog.name}"
         end
         print "what breed would you like to know more about?"
         input = gets.chomp.downcase
         breed_selection(input)
     end


     def breed_selection(breed)
      pups = Dogs.find_by_breed(breed)
      pups.map{|pup| puts pup.name}
      menu
     end
      



     def goodbye
        puts "Alright, Goodbye!"
     end
end