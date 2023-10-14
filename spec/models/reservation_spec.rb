require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:car) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:pick_up) }
  it { should validate_presence_of(:return_date) }
end
