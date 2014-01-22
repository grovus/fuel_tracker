require 'spec_helper'

describe Vehicle do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @vehicle = user.vehicles.build(	name: "My Vehicle", 
									make: "Test Make", 
									model: "Test Model", 
									year: 2010,
									odometer: 100000)
  end

  subject { @vehicle }

  it { should respond_to(:name) }
  it { should respond_to(:make) }
  it { should respond_to(:model) }
  it { should respond_to(:year) }
  it { should respond_to(:odometer) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @vehicle.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when name is blank" do
  	before { @vehicle.name = " " }
  	it { should_not be_valid }
  end

  describe "when make is blank" do
  	before { @vehicle.make = " " }
  	it { should_not be_valid }
  end

  describe "when model is blank" do
  	before { @vehicle.model = " " }
  	it { should_not be_valid }
  end

  describe "when year is blank" do
  	before { @vehicle.year = " " }
  	it { should_not be_valid }
  end

end
