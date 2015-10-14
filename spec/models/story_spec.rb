require 'rails_helper'

describe Story do
  it { should belong_to :user }
  it { should have_many :sentences }
  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
end
