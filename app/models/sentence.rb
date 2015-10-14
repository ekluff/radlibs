class Sentence < ActiveRecord::Base
  has_attached_file :asset, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :story

  after_validation :periodizerer

  validates :content, presence:true
  validates :asset, presence:true


  private

  def periodizerer
    self.content.capitalize!
    if self.content[-1] != "."
      self.content += "."
    end
  end
end
