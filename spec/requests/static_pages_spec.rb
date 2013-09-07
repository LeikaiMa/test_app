require 'spec_helper'

describe "Static pages" do
  subject {page}
  describe "Home page" do
    # it "should have the content 'Sample App'" do
    #   visit root_path
    #   page.should have_selector('h1', :text => 'Sample App')


    # end
    before { visit root_path}
    it {should have_selector('title',
                             text: full_title(''))}
    # it "should have the title 'Home'" do

    #   page.should have_selector('title',
    #                             :text => "Ruby on Rails Tutorial Sample App")
    # end

    # it "should not have a custom page title'" do
    #   visit root_path
    #   page.should have_selector('title',
    #                             :text => "| Home")
    # end
  end

  describe "Help page" do
    before {visit help_path}
    it {should have_selector('h1', text: 'Help')}



    it {page.should have_selector('title', text: full_title('Help'))}
  end

  describe "About page" do
    before {visit about_path}
    it {should have_selector('h1', text: 'About Us')}

    it {should have_selector('title',
                             text: full_title('About Us'))}
  end

  describe "Contact page" do
    before {visit contact_path}
    it {should have_selector('h1', text:  'Contact Us')}

    it {page.should have_selector('title',
                                text: full_title(''))}

  end

end
