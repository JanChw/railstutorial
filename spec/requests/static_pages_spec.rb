require 'rails_helper'
require 'spec_helper'

RSpec.describe "StaticPages", type: :request do
  describe "home page" do
    it "should have the content 'StaticPages#home' " do
      visit '/'
      expect(page).to have_content('StaticPages#home')
    end
  end

  describe "help page" do
    it "should have the content 'StaticPages#https://relishapp' " do
      visit '/help'
      expect(page).to have_content('StaticPages#help')
    end
  end
end
