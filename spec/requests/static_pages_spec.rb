require 'rails_helper'
require 'spec_helper'
require 'support/utilities'

RSpec.describe "StaticPages", type: :request do
  subject {page}

  describe "home page" do
    before {visit root_path}

    it { should have_content('railstutorial') }
    it { should have_title(full_title("Home"))}
  end

  describe "help page" do
    it "should have the content 'StaticPages#help' " do
      visit help_path
      expect(page).to have_content('StaticPages#help')
    end

    it "should have the content 'Railstutorial | Help'" do
      visit '/help'
      expect(page).to have_title("Railstutorial | Help")
    end
  end

  describe "about page" do
    it "should have the content 'about page'" do
      visit about_path
      expect(page).to have_content('About page')
    end

    it "should have the title 'RailsTutotial | About'" do
      visit about_path
      expect(page).to have_title('Railstutorial | About')
    end
  end

  describe "contact page" do
    it "should have the content 'contact page'" do
      visit contact_path
      expect(page).to have_content('Contact page')
    end

    it "should have the title 'RailsTutotial | Contact'" do
      visit contact_path
      expect(page).to have_title('Railstutorial | Contact')
    end
  end

end
