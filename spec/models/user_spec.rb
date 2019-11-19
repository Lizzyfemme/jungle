require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a vaild user' do
      user = User.new(
        name: "Lucy",
        last_name: "Fox",
        email: "lucy@email.com",
        password: "FoxyLucy", 
        password_confirmation: "FoxyLucy"
        )
      expect(user).to (be_valid)
    end

    it 'should have unique emails' do
      @userA = User.new(
        name: "Fred",
        last_name: "Flinstone",
        email: "fred@email.com",
        password: "Fred5T0ne", 
        password_confirmation: "Fred5T0ne"
        )
 

      @userB = User.new(
        name: "Ellen",
        last_name: "James",
        email: "FreD@eMAil.cOm",
        password: "E!!3n", 
        password_confirmation: "E!!3n"
        )
        expect(@userA.save).to be true
        expect(@userB.save).to be false
    end

    it 'should not save without a password' do
      user = User.new(
        name: "Lucy",
        last_name: "Fox",
        email: "lucy@email.com",
        password: nil, 
        password_confirmation: "FoxyLucy"
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save without confirming the password' do
      user = User.new(
        name: "Lucy",
        last_name: "Fox",
        email: "lucy@email.com",
        password: "FoxyLucy", 
        password_confirmation: nil
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save if the password is too short' do
      user = User.new(
        name: "Lucy",
        last_name: "Fox",
        email: "lucy@email.com",
        password: "Fox", 
        password_confirmation: nil
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save without an email address' do
      user = User.new(
        name: "Lucy",
        last_name: "Fox",
        email: nil,
        password: "FoxyLucy", 
        password_confirmation: "FoxyLucy"
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save without a first name' do
      user = User.new(
        name: nil,
        last_name: "Fox",
        email: "lucy@email.com",
        password: "FoxyLucy", 
        password_confirmation: "FoxyLucy"
        )
      expect(user).to_not (be_valid)
    end


    it 'should not save without a last name' do
      user = User.new(
        name: "Lucy",
        last_name: nil,
        email: "lucy@email.com",
        password: "FoxyLucy", 
        password_confirmation: "FoxyLucy"
        )
      expect(user).to_not (be_valid)
    end

    it 'should not save user due to unmatched passwords' do
      @user = User.new({
        name:  'Jon',
        last_name: 'Doe',
        email: 'joendoe@example.com',
        password: 'testpass',
        password_confirmation: 'pass'
      })

      expect(@user.save).to be false
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should return an instance of the user if authenticated' do

      mock_user = {
        name:  'John',
        last_name: 'Doet',
        email: 'jondoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      }

      @user = User.new(mock_user)
      @user.save!
      @authenticated_user = User.authenticate_with_credentials(mock_user[:email], mock_user[:password])

      expect(@authenticated_user).to be_present

    end


  end
end


