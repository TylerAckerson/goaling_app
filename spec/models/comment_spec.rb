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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
