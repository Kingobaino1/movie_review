require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:opinions).class_name('Opinion') }
    it { should have_one(:photo_attachment) }
    it { should have_one(:cover_image_attachment) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:user_name) }
    it { should validate_length_of(:user_name).is_at_least(3) }
  end
end
