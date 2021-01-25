require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:comments).class_name('Comment') }
    it { should have_one(:image_attachment) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:genre) }
    it { should validate_length_of(:content).is_at_most(140) }
  end
end
