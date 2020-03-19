# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Source < ApplicationRecord
  has_many :follows, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :fans, :through => :follows, :source => :fan
  validates :name, :presence => true 
end
