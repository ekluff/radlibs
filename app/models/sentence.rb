class Sentence < ActiveRecord::Base
  has_attached_file :asset, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :story

  validates :content, presence:true
end
