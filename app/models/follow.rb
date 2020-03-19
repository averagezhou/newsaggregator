# == Schema Information
#
# Table name: follows
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :integer
#  source_id   :integer
#

class Follow < ApplicationRecord
  belongs_to :fan, :class_name => "User", :foreign_key => "follower_id"
  belongs_to :source 
end
