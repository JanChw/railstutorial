require 'rails_helper'
# require 'spec_helper'

RSpec.describe User, type: :model do
  before { @user = User.new(name: 'Example User', email: 'user@example.com', password: "exampleuser", password_confirmation: "exampleuser")}

  subject { @user }

  describe " name and email attributes are present" do
	it { should respond_to(:name)}
	it { should respond_to(:email)}
	it { should respond_to(:password_digest)}
	it { should respond_to(:password)}
	it { should respond_to(:password_confirmation)}


  it { should respond_to(:authenticate)}

	it { should be_valid}
  end


  describe "when name is not present" do
  	before { @user.name = " "}
  	it { should_not be_valid }
  end

  describe "when eamil is not present" do
  	before { @user.email = " "}
  	it { should_not be_valid}
  end

  describe "when name is too long" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid}
  end

  describe "when email format is invalid" do
  	it " should be  invalid" do
  		addresses = %w[user@foo,com user_at_too.org example.user@foo. foo@bar_barz.com foo@bar+baz.com]
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when eamil format is valid " do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "when eamil address is already taken" do
  	before do
  		user_with_same_email= @user.dup
  		user_with_same_email.name = "jan"
  		user_with_same_email.save
  	end

  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before { @user = User.new(name: "Example User", email: "user@example.com", 
  		password: " ", password_confirmation: " ")}

  	it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "unconfirmation"}

  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email)}

    describe " with valid password" do
      it { should eq found_user.authenticate(@user.password)}
    end

    describe " whith invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid")}

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }

    it { should be_invalid }
  end

  describe " email address with mixed case" do
    let(:mixed_case_email) { "Foo@Example.Com" }

    it "should be saved as all lower-case" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

end
