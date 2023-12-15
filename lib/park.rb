class Park 
    attr_reader :name,
                :admission_price,
                :vehicles,
                :revenue

    def initialize(name, admission_price)
        @name = name 
        @admission_price = admission_price
        @vehicles = []
        @revenue = 0
    end

    def enter_park(vehicle)
        charge_admission(vehicle)
        @vehicles << vehicle
    end

    def list_all_passengers
        @vehicles.map do |vehicle|
            vehicle.passengers 
        end.flatten
    end 

    def charge_admission(vehicle)
        vehicle.passengers.each do |person|
            if person.adult? 
                @revenue += @admission_price 
            end
        end
    end 
end