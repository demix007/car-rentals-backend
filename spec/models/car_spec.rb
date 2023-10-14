require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:photo) }
end
