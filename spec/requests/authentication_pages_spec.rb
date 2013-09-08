require 'spec_helper'

# describe "AuthenticationPages" do
#   # describe "GET /authentication_pages" do
#   #   it "works! (now write some real specs)" do
#   #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#   #     get authentication_pages_index_path
#   #     response.status.should be(200)
#   #   end
#   # end


# end
describe "Authentication" do
  subject {page}
  describe "signin page" do
    before do
      visit signin_path
    end
    it { should have_content('Sign in')}
    it {should have_selector('title', text: full_title('Sign in'))}

  end
  describe "signin" do
    before { visit signin_path }
    describe "with invalid information" do
      before { click_button "Sign in" }
      it {should have_selector('title', text: full_title('Sign in'))}
      it {should have_selector('div.alert.alert-error', text: 'Invalid')}

    end

    describe "after visiting another page" do
      before { click_link "Home" }
      it { should_not have_selector('div.alert.alert-error') }
    end


    describe "with valid information" do
      let(:user) {FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user))}
      it {should have_link('Sign out', href: signout_path) }
      it {should_not have_link('Sign in', href: signin_path)}


      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
      # describe "after saving the user" do
      #   before { click_button submit }
      #   let(:user) { User.find_by(email: 'user@example.com') }
      #   it { should have_link('Sign out') }
      #   it { should have_selector('title', text: full_title('Sign out')) }
      #   it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      # end
    end

  end
end