class Story < ActiveRecord::Base
  belongs_to :user
  has_many :sentences

  validates :title, { presence: true, uniqueness: true }
end
