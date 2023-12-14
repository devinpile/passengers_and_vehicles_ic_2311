require './lib/passenger'

RSpec.describe Passenger do 
    before do 
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end

    it 'exists and has readable attributes' do 
        expect(@charlie).to be_an_instance_of Passenger 
        expect(@charlie.name).to eq 'Charlie'
        expect(@charlie.age).to eq 18
    end 

    it 'can tell if a passenger is an adult' do 
        expect(@charlie.adult?).to eq true
        expect(@ctaylor.adult?).to eq false
    end 

    it 'can tell if a passenger is driving' do 
        expect(@charlie.driver?).to eq false 
    end 

    it 'can assign a passenger to drive' do 
        @charlie.drive 

        expect(@charlie.driver?).to eq true
    end 
end 