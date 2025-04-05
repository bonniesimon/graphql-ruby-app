# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :text             not null
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  has_many :comments
end
