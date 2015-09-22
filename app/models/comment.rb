# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text             not null
#  commenter_id     :integer          not null
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  validates :body, :commenter_id, :commentable_type, :commentable_id, presence: true

  belongs_to :commentable, polymorphic: true
  
end
