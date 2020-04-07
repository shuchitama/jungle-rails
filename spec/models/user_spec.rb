require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "saves successfully with all fields set" do
      user = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Password")
      expect(user.errors.full_messages).to be_empty
    end

    it "is invalid when password and password confirmation fields do not match" do
      user = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Wrong-password")
      expect(user.errors.full_messages.first).to eq "Password confirmation doesn't match Password"
    end

    it "is invalid when password is not set" do
      user = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password_confirmation: "Password")
      expect(user.errors.full_messages.first).to eq "Password can't be blank"
    end

    it "is invalid when password is less than 8 characters" do
      user = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Pass")
      expect(user.errors.full_messages.first).to eq "Password is too short (minimum is 8 characters)"
    end

    it "is invalid when email is not set" do
      user = User.create(first_name: "First", last_name: "Last", password: "Password")
      expect(user.errors.full_messages.first).to eq "Email can't be blank"
    end

    it "is invalid when email is not unique" do
      user = User.create(first_name: "First", last_name: "Last", email: "TEST@TEST.com", password: "Password")
      user2 = User.create(first_name: "Firstname", last_name: "Lastname", email: "test@test.COM", password: "Password")
      expect(user2.errors.full_messages.first).to eq "Email has already been taken"
    end

    it "is invalid when first name is not set" do
      user = User.create(last_name: "Last", email: "generic@email.com", password: "Password")
      expect(user.errors.full_messages.first).to eq "First name can't be blank"
    end

    it "is invalid when last name is not set" do
      user = User.create(first_name: "First", email: "generic@email.com", password: "Password")
      expect(user.errors.full_messages.first).to eq "Last name can't be blank"
    end
    
  end

  describe '.authenticate_with_credentials' do

    it "logs in successfully with correct credentials" do
      registerUser = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Password")
      loginUser = User.authenticate_with_credentials("generic@email.com", "Password")
      expect(loginUser).to_not be nil
    end

    it 'does not log in with non existent email' do
      registerUser = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Password")
      loginUser = User.authenticate_with_credentials('wrong@email.com', 'Password')
      expect(loginUser).to be nil
    end

    it 'does not log in with an incorrect password' do
      registerUser = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Password")
      loginUser = User.authenticate_with_credentials('generic@email.com', 'wrong_password')
      expect(loginUser).to be nil
    end

    it 'logs in with an email with extra spaces' do
      registerUser = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Password")
      loginUser = User.authenticate_with_credentials('  generic@email.com   ', 'Password')
      expect(loginUser).to_not be nil
    end

    it 'logs in with an email with different cases' do
      registerUser = User.create(first_name: "First", last_name: "Last", email: "generic@email.com", password: "Password", password_confirmation: "Password")
      loginUser = User.authenticate_with_credentials('gENEriC@email.com', 'Password')
      expect(loginUser).to_not be nil
    end
  end
end
