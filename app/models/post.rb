class Post < ApplicationRecord
  # postはuserに属するという規約
  belongs_to :user, optional: true

  # バリデーション（空チェック、文字数チェック）
  validates :content, presence: true, length: { maximum: 280 }
end
