require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do 
    before do 
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end 

    it 'exists and has readable attributes' do 
        expect(@vehicle).to be_an_instance_of Vehicle 
        expect(@vehicle.year).to eq "2001"
        expect(@vehicle.make).to eq "Honda"
        expect(@vehicle.model).to eq "Civic"
    end 

    it 'can check if a vehicle is speeding' do 
        expect(@vehicle.speeding?).to eq false
    end 

    it 'can make a vehicle speed' do 
        @vehicle.speed 

        expect(@vehicle.speeding?).to eq true
    end 

    describe 'vehicle passengers' do 
        it 'can return all of the passengers in the vehicle' do 
            expect(@vehicle.passengers).to eq []
        end
    
        it 'can #add_passenger to the vehicle' do 
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude)
            @vehicle.add_passenger(@taylor)
            
            expect(@vehicle.passengers).to eq [@charlie, @jude, @taylor]
        end 
        
        it 'can return the number of adults in the vehicle' do 
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude)
            @vehicle.add_passenger(@taylor)

            expect(@vehicle.num_adults).to eq 2 
        end 
    end
end 