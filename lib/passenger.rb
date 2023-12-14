class Passenger 
    attr_reader :name,
                :age 

    def initialize(info)
        @name = info["name"]
        @age = info["age"]
        @driving = false
    end

    def adult?
        @age >= 18
    end 

    def driver?
        @driving == true
    end

    def drive 
        @driving = true
    end
end