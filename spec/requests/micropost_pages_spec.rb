require 'spec_helper'

describe "MicropostPages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "Time Task creation" do
    before {visit root_path}
    describe "with invalid information" do
      it "should not create a timetask" do
        expect {click_button "Render"}.not_to change(Micropost, :count)
      end

      describe "error messages" do
      	before { click_button "Render" }
      	it { should have_content('error') }
      end
    end

    describe "with valid information" do
    	before { fill_in 'micropost_content', with: "Lorem ipsum" }
    	it "should create a time task" do
    	  expect {click_button "Render"}.to change(Micropost, :count).by(1)
    	end
    end
  end

  describe "timetask descruction" do
  	before { FactoryGirl.create(:micropost, user: user) }
  	describe "as correct user" do
  		before { visit root_path }

  		it "should delete a timetask" do
  			expect { click_link "delete"}.to change(Micropost, :count).by(-1)
  			
  		end
  	end
  	
  end
end
