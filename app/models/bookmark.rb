# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer
#  owner_id   :integer
#

class Bookmark < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  belongs_to :article
  validates :owner_id, :presence => true
  validates :article_id, :presence => true
end
