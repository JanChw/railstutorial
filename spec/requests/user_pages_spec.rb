require 'rails_helper'
require 'spec_helper'
require 'support/utilities'

RSpec.describe "UserPages", type: :request do
	subject { page }

  describe "signup page" do

  	before { visit signup_path }
    let(:submit) { "create my account"}

    describe "with valid information" do
  		before do
  			fill_in "Name",		with: "Example User"
  			fill_in "Email",	with: "user@example.com"
  			fill_in "Password",	with: "example"
  			fill_in "Confirmation", with: "example"
  		end

  		it "should create a user" do
  			expect { click_button submit }.to change(User, :count).by(1)
  		end
  	end

    it { should have_content('signup page')}
    it { should have_title(full_title('Sign up'))}
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user)}
  	before { visit user_path(user) }

  	it { should have_content(user.name)}
  end

end
