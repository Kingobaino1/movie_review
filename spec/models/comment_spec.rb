require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:opinion).class_name('Opinion') }
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:opinion_id) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(50) }
  end
end
