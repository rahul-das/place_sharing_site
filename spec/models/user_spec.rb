require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    
    it { should allow_value("email@addresse.foo").for(:email) }
    it { should_not allow_value("foo").for(:email) }
  end
  
  describe 'association' do
    it { should have_many(:shares) }
    it { should have_many(:shared_places).through(:shares) }
    it { should have_many(:created_places) }
  end
  
  describe 'column_specification' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:slug).of_type(:string) }
    
    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:slug).unique(true) }
  end
  
  describe 'scope' do
    let!(:user_1) {FactoryBot.create(:user)}
    let!(:user_2) {FactoryBot.create(:user)}
    let!(:user_3) {FactoryBot.create(:user)}

    it 'returns all users except the params user' do
      expect(User.all_except(user_2).count).to eq(2)
    end
  end

end
