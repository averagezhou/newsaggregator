# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  author         :string
#  bookmark_count :integer          default(0)
#  description    :text
#  image          :string
#  published_at   :datetime
#  title          :string
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  source_id      :integer
#

class Article < ApplicationRecord
  has_many :bookmarks, :dependent => :destroy
  belongs_to :source 
  has_many :readers, :through => :bookmarks, :source => :owner
  has_one :viewer, :through => :source, :source => :fans
  validates :url, :presence => true
  validates :title, :presence => true
end
