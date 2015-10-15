require 'elasticsearch/model'

class Story < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_attached_file :asset, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  has_many :sentences, dependent: :destroy

  validates :title, { presence: true, uniqueness: true }
  validates :asset, presence:true
  sync :all
end

Story.import force: true # for auto sync model with elastic search
