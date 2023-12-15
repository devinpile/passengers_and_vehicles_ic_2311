require './lib/park'
require './lib/vehicle'
require './lib/passenger'

RSpec.describe Park do 
    before do 
        @park = Park.new("Happy Park", 10)
        @vehicle_1 = Vehicle.new("2001", "Honda", "Civic")
        @vehicle_2 = Vehicle.new("2017", "Nissan", "Sentra")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jake = Passenger.new({"name" => "Jake", "age" => 20})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
        @teddy = Passenger.new({"name" => "Teddy", "age" => 4})
        @jude = Passenger.new({"name" => "Jude", "age" => 1})
        @devin = Passenger.new({"name" => "Devin", "age" => 37})
    end 

    it 'exists and has readable attributes' do 
        expect(@park).to be_an_instance_of Park 
        expect(@park.name).to eq "Happy Park"
        expect(@park.admission_price).to be 10
    end 

    describe 'entering a park' do 
        it 'can have vehicles enter the park' do 
            expect(@park.vehicles).to eq []

            @park.enter_park(@vehicle_2) 
            
            expect(@park.vehicles).to eq [@vehicle_2]
        end 
        
        it 'can list all passengers that have entered the park' do 
            @vehicle_1.add_passenger(@charlie)
            @vehicle_1.add_passenger(@jake)
            @vehicle_1.add_passenger(@taylor)
            @park.enter_park(@vehicle_1) 
            
            expect(@park.list_all_passengers).to eq [@charlie, @jake, @taylor]
            expect(@park.list_all_passengers).not_to include @devin
            expect(@park.list_all_passengers).not_to include @teddy
            expect(@park.list_all_passengers).not_to include @jude
        end 
    end
    
    describe 'revenue' do 
        it 'can calculate revenue generated' do 
            @vehicle_1.add_passenger(@charlie)
            @vehicle_1.add_passenger(@jake)
            @vehicle_1.add_passenger(@taylor) 
            
            @park.enter_park(@vehicle_1) 
            
            expect(@park.revenue).to eq 20
        end 
    end
    
    describe 'tracking all patrons' do 
        it 'can alphabetically list #all_attendess' do 
            @vehicle_1.add_passenger(@charlie)
            @vehicle_1.add_passenger(@jake)
            @vehicle_1.add_passenger(@taylor) 
            @vehicle_2.add_passenger(@devin)
            @vehicle_2.add_passenger(@teddy)
            @vehicle_2.add_passenger(@jude) 
            @park.enter_park(@vehicle_1) 
            @park.enter_park(@vehicle_2) 

            expect(@park.all_attendess).to eq [@charlie, @devin, @jake, @jude, @taylor, @teddy]
        end

        it 'can alphabetically list #all_adults' do 
            @vehicle_1.add_passenger(@charlie)
            @vehicle_1.add_passenger(@jake)
            @vehicle_1.add_passenger(@taylor) 
            @vehicle_2.add_passenger(@devin)
            @vehicle_2.add_passenger(@teddy)
            @vehicle_2.add_passenger(@jude) 
            @park.enter_park(@vehicle_1) 
            @park.enter_park(@vehicle_2) 

            expect(@park.all_adults).to eq [@charlie, @devin, @jake]
        end
        
        it 'can alphabetically list #all_minors' do 
            @vehicle_1.add_passenger(@charlie)
            @vehicle_1.add_passenger(@jake)
            @vehicle_1.add_passenger(@taylor) 
            @vehicle_2.add_passenger(@devin)
            @vehicle_2.add_passenger(@teddy)
            @vehicle_2.add_passenger(@jude) 
            @park.enter_park(@vehicle_1) 
            @park.enter_park(@vehicle_2) 
        
            expect(@park.all_minors).to eq [@jude, @taylor, @teddy]
        end
    end 
end 