require 'rails_helper'
require 'support/utilities'

RSpec.describe "UserPages", type: :request do
	subject {page}

  describe "signup page" do
  	before { visit signup_path}

    it { should have_content('signup page')}
    it { should have_title(full_title('Sign up'))}
  end
end
