require 'rails_helper'
require 'spec_helper'

RSpec.describe "StaticPages", type: :request do
  describe "home page" do
    it "should have the content 'StaticPages#home' " do
      visit '/'
      expect(page).to have_content('StaticPages#home')
    end

    it "should have the title 'Railstutorial | Home' " do
      visit '/'
      expect(page).to have_title("Railstutorial | Home")
    end

  end

  describe "help page" do
    it "should have the content 'StaticPages#help' " do
      visit '/help'
      expect(page).to have_content('StaticPages#help')
    end

    it "should have the content 'Railstutorial | Help'" do
      visit '/help'
      expect(page).to have_title("Railstutorial | Help")
    end
  end
end
