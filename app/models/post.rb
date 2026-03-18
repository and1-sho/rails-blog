class Post < ApplicationRecord
  # postはuserに属するという規約
  belongs_to :user, optional: true
end
