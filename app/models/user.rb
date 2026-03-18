class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # Userモデルは複数のPostを持つ、Userが削除されたらその人の投稿も一緒に削除されるという規約
  has_many :posts, dependent: :destroy
end
