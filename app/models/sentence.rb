class Sentence < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  validates :content, presence:true 
end
