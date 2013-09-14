require 'spec_helper'

describe "Static pages" do
  subject {page}
  describe "Home page" do
    # it "should have the content 'Sample App'" do
    #   visit root_path
    #   page.should have_selector('h1', :text => 'Sample App')


    # end
    before { visit root_path }
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

    # describe "for signed-in users" do
    #   let(:user) { FactoryGirl.create(:user) }
      describe "for signed-in users" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
          sign_in user
          visit root_path
        end

        it "should render the user's feed" do
          user.feed.each do |item|
            expect(page).to have_selector("li##{item.id}", text: item.content)
          end
        end
        describe "accepted/rendered counts" do
          let(:other_user) {FactoryGirl.create(:user)}
          before do
            other_user.follow!(user)
            visit root_path
          end
          
          it { should have_link("0 accepted", href: following_user_path(user)) }
          it { should have_link("1 rendered", href: followers_user_path(user)) }
        end
      end
      
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
