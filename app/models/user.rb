class User < ApplicationRecord
  kadai1to2 = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  kadai3 = /\A.+@.+\..+\z/
  
  validates :name, presence: true, length: {maximum: 15 }
  validates :email, presence: true, format: { with: kadai3 }
  validates :password, presence: true, format: { with: kadai1to2 }

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end