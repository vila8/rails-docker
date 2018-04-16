class Comment < ActiveRecord::Base

  validates :username,  presence: true, allow_blank: false
  validates :text,      presence: true, allow_blank: false

  belongs_to :user
end
