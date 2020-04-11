require 'rails_helper'

RSpec.describe Place, type: :model do
  
  describe 'validation' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
  end
  
  describe 'association' do
    it { should belong_to(:user) }
    it { should have_many(:shares) }
    it { should have_many(:shared_users).through(:shares) }
  end
  
  describe 'column_specification' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:latitude).of_type(:decimal) }
    it { should have_db_column(:longitude).of_type(:decimal) }
    it { should have_db_column(:is_public).of_type(:boolean) }
    it { should have_db_column(:user_id).of_type(:integer) }
    
    it { should have_db_index(:user_id) }
  end
  
  describe 'scope' do
    let!(:user_1) {FactoryBot.create(:user)}
    let!(:user_2) {FactoryBot.create(:user)}
    let!(:place_1) {FactoryBot.create(:place, user: user_1)}
    let!(:place_2) {FactoryBot.create(:place, user: user_2, is_public: false)}
    let!(:place_3) {FactoryBot.create(:place, user: user_2)}
    let!(:share_1) {FactoryBot.create(:share, user: user_2, place: place_1)}
    let!(:share_2) {FactoryBot.create(:share, user: user_2, place: place_2)}

    it 'returns places that is public' do
      expect(Place.shared_public.count).to eq(2)
    end

    it 'returns places shared with the user' do
      expect(Place.shared_with(user_2).count).to eq(2)
    end

    it 'returns places not_cteated_by the user' do
      expect(Place.not_cteated_by(user_2).count).to eq(1)
    end
  end

end
