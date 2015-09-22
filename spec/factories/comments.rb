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

FactoryGirl.define do
  factory :comment do
    
  end

end
