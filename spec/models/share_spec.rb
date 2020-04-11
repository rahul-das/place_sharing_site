require 'rails_helper'

RSpec.describe Share, type: :model do
  
  describe 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:place) }
  end
  
  describe 'column_specification' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:place_id).of_type(:integer) }
    
    it { should have_db_index(:user_id) }
    it { should have_db_index(:place_id) }
  end

end
