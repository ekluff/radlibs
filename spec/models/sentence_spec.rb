require 'rails_helper'

describe Sentence do
  it { should validate_presence_of :content }
  it { should belong_to :story }
  it { should belong_to :user }
  it "puts a period on the end if it doesn't have one" do
    test_sentence = "i am a taco"
    expect(test_sentence.periodizerer).to eq("I am a taco.")
  end
end
