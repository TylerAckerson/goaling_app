# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  prvt       :boolean          default(FALSE)
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean          default(FALSE)
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :prvt, inclusion: { in: [true, false] }

  belongs_to :user

  has_many :comments, as: :commentable

  def prvt?
    self.prvt
  end

end
