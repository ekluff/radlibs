require 'rails_helper'

describe User do
  it { should have_many :stories }
  it { should have_many :sentences }
end
