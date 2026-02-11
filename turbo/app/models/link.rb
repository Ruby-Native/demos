class Link < ApplicationRecord
  belongs_to :user
  has_many :link_tags, dependent: :destroy
  has_many :tags, through: :link_tags

  validates :title, :url, presence: true
end
