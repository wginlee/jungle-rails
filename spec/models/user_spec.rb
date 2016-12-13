require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'on a new user' do

      let(:user) {User.new first_name: 'Bob', last_name: 'Saget', email: 'bob@saget.com', password: 'hunter2', password_confirmation: 'hunter2'}

      it 'should have a valid test subject' do
        expect(user).to be_valid
      end

      it 'should not be valid without a password' do
        user.password = user.password_confirmation = nil
        expect(user).to_not be_valid
      end

      it 'should be not be valid with a short password' do
        user.password = user.password_confirmation = 'short'
        expect(user).to_not be_valid

      end

      it 'should not be valid with a confirmation mismatch' do
        user.password = 'short'
        user.password_confirmation = 'long'
        expect(user).to_not be_valid
      end

      it 'should be invalid without a first name' do
        user.first_name = nil
        expect(user).to_not be_valid
      end

      it 'should be invalid without a last name' do
        user.last_name = nil
        expect(user).to_not be_valid
      end

      it 'should be invalid without a email' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'should be invalid with an email that already exists in the database' do
        user.save
        user_with_same_email = user.dup
        expect(user_with_same_email).to_not be_valid
      end



    end


  end

  describe '.authenticate_with_credentials' do
    before :each do
      @user_on_database = User.create( first_name: 'Bob', last_name: 'Saget', email: 'bob@saget.com', password: 'hunter2', password_confirmation: 'hunter2')

    end

    it 'should be able to log an user in with the right credentials' do
      user = User.authenticate_with_credentials(@user_on_database.email, @user_on_database.password)
      expect(user).to_not be_falsey
    end

    it 'should be able to log an user in with the right credentials with spaces before and/or after their email' do
      user = User.authenticate_with_credentials('  ' << @user_on_database.email << '  ', @user_on_database.password)
      expect(user).to_not be_falsey
    end

    it 'should be able to log an user in with the right credentials insensitive to letter case' do
      user = User.authenticate_with_credentials(@user_on_database.email.upcase, @user_on_database.password)
      expect(user).to_not be_falsey

    end



  end


end
