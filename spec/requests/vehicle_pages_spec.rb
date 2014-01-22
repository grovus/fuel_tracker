require 'spec_helper'

describe "Vehicle Pages" do
	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "vehicle creation" do
		before { visit new_vehicle_path }

		describe "with invalid information" do

			it "should not create a vehicle" do
				expect { click_button "Add Vehicle" }.not_to change(Vehicle, :count)
			end

			describe "error messages" do
				before { click_button "Add Vehicle" }
				it { should have_content('error') }
			end

		end

    	describe "with valid information" do
      		before do
        		fill_in "Name",         with: "My New Vehicle"
        		fill_in "Make",         with: %w[Honda Toyota Nissan].sample(1)[0]
        		fill_in "Model",        with: "Model 1"
        		fill_in "Year", 		with: rand(2000..Time.now.year+1)
      		end

      		it "should create a vehicle" do
        		expect { click_button "Add Vehicle" }.to change(Vehicle, :count).by(1)
      		end

      		describe "after saving the vehicle" do
        		before { click_button "Add Vehicle" }
        		let(:vehicle) { Vehicle.find_by(name: 'My New Vehicle') }

				specify { expect(user).to eq vehicle.user }        		
        		it { should have_link('Sign out') }
        		it { should have_title(vehicle.name) }
        		it { should have_selector('div.alert.alert-success', text: 'Vehicle created') }
      		end     
    	end

	end

	describe "vehicle destruction" do
		let!(:vehicle) { FactoryGirl.create(:vehicle, user: user) }

		describe "as correct user" do
			before { visit root_path }

			it "should delete a vehicle" do
				within "#vehicle_#{vehicle.id}" do
					expect { click_link "delete" }.to change(Vehicle, :count).by(-1)
				end
			end
		end

	end
end
