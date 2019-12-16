require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(
    name: "dog",
    email: "dog@dog.dog",
    password: "dog"
    ) 
  }
  before do
    @user = User.create(
      name: "poop", 
      email: "poop@doodoo.com", 
      password: "123", 
      password_confirmation: "123")
  end

  describe "lol" do

    it "is not valid when pw don't match" do
      @user.password_confirmation = "321"
      expect(@user.password_confirmation).to_not eql("123")
    end

    it "matches password" do
      expect(@user.password).to eql(@user.password_confirmation)
    end

    it "needs to have both password fields" do
      expect(@user.password).to_not eql(nil)
    end

    it "can't have the same email" do
      @user.email = "dog@dog.dog"
      expect(@user).to_not be_valid
    end

    it "can't have a short password" do
      @user.password = "d"
      expect(@user).to_not be_valid
    end

    it "can input spaces in email" do
      expect(User.authenticate_with_credentials("poop@doodoo.com ", @user.password)).to eql(@user)
    end

  end


end
