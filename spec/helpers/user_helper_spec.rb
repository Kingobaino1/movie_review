require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UserHelper. For example:
#
# describe UserHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  before :each do
    @user1 = User.create(full_name: 'John', user_name: 'jon', email: 'john@example.com', password: 'password')
    @user2 = User.create(full_name: 'Odogwu', user_name: 'nwa', email: 'odogwu@example.com', password: 'password')
    @user3 = User.create(full_name: 'Harry', user_name: 'potter', email: 'harry@example.com', password: 'password')
    @user1.following << @user3
  end

  describe 'follow' do
    it 'displays users to follow' do
      return who_to_follow(@user3) unless @user1.following.include?(@user3)
    end
  end
end
