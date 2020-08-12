
class CLI
   
    def run
      @api = API.new
      @api.dog_breeds
      system("clear")
      
       puts "LETS LEARN ABOUT SPECIFIC DOG BREEDS!!".colorize(:yellow)
       puts "\n"

       ascii 

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
            ascii2
           goodbye
         else
            puts "Invalid Input. Try again".colorize(:red)
            sleep(1.0)
            run
         end
     end

     def all_dog_breeds
         Dogs.all.each_with_index do |dog, index|
            puts "#{index + 1}. #{dog.name}"
         end
         print "what breed would you like to know more about? Type breed name or number."
         input = gets.chomp.downcase
         breed_selection(input)
     end


     def breed_selection(input)
      system("printf '\33c\e[3J'")

      if input.to_i > 0 && input.to_i < 173
         dog = Dogs.all[input.to_i - 1]
         if dog.length == 0 
            puts "try again"
         end
            
         puts "\n"
                  puts "1) Name: #{dog.name}".colorize(:blue)
                  puts "Life expectancy: #{dog.life_span}".colorize(:green)
                  puts "Temperament: #{dog.temperament}".colorize(:green)
                  puts "Bred For: #{dog.bred_for}".colorize(:green)
                  puts "\n"

         # print out dog and dog details using index (BUT HOW?!)

      else input.to_i == 0
         pups = Dogs.find_by_breed(input) 
            if pups.length == 0 
                puts "Try again"
            end
               pups.each_with_index do |pup , index|
                  puts "\n"
                  puts "#{index + 1}) Name: #{pup.name}".colorize(:blue)
                  puts "Life expectancy: #{pup.life_span}".colorize(:green)
                  puts "Temperament: #{pup.temperament}".colorize(:green)
                  puts "Bred For: #{pup.bred_for}".colorize(:green)
                  puts "\n"
               end
      end

      menu
     end
      



     def goodbye
        puts "Alright, Goodbye! WOOF WOOF".colorize(:red)
     end
end