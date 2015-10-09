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
    before {visit help_path}

    it { should have_content('StaticPages#help')}
    it { should have_title(full_title('Help'))}
  end

  describe "about page" do
    before {visit about_path}

    it { should have_content('About page')}
    it { should have_title(full_title('About'))}
  end

  describe "contact page" do
    before {visit contact_path}

    it { should have_content('Contact page')}
    it { should have_title(full_title('Contact'))}
  end

end
