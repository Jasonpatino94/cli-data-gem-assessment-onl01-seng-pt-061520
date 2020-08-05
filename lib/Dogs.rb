class Dogs
    attr_accessor :name, :life_span, :temperament, :bred_for

    @@all = []

    def initialize(dog_list)
        @name = dog_list["name"]
        @life_span = dog_list["life_span"]
        @temperament = dog_list["temperament"]
        @bred_for = dog_list["bred_for"]
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_breed(name)
        self.all.select{|dog| dog.name.downcase.include?(name.downcase)}

    end


end

def ascii
         puts "                    |\_/|                  
                    | @ @   Woof! 
                    |   <>              _  
                    |  _/\------____ ((| |))
                    |               `--' |   
                ____|_       ___|   |___.' 
               /_/_____/____/_______|".colorize(:light_black)
     end

     def ascii2
        puts "                     .--~~,__
        :-....,-------`~~'._.'
         `-,,,  ,_      ;'~U'
          _,-' ,'`-__; '--.
         (_/'~~      ''''(;".colorize(:yellow)
    end
