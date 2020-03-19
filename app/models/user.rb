# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many :bookmarks, :foreign_key => "owner_id", :dependent => :destroy
  has_many :follow, :foreign_key => "follower_id", :dependent => :destroy
  has_many :bookmarked_articles, :through => :bookmarks, :source => :article
  has_many :followed_sources, :through => :follow, :source => :source
  has_many :feed, :through => :followed_sources, :source => :articles
  validates :username, :presence => true
  validates :username, :uniqueness => true 
end
