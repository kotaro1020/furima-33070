class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', message: '全角文字を使用してください'
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :firstname
    validates :lastname
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字を使用してください' } do
    validates :firstname_kana
    validates :lastname_kana
  end
  has_many :items
  has_many :product_records
end
