class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchasers

  with_options presence: true do
    validates :nickname

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates_format_of :password, with: PASSWORD_REGEX

    # 名前(全角)は、全角（漢字・ひらがな・カタカナ）
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

    # 名前カナ(全角)は、全角（カタカナ）
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }

    validates :birthday

    # Deviseにデフォルトでバリデーションが備わっているため、テストのみ実施する
    # メールアドレスが必須であること
    # メールアドレスが一意性であること
    # メールアドレスは、@を含む必要があること
    # パスワードが必須であること
    # パスワードは、6文字以上での入力が必須であること
    # パスワードとパスワード（確認）は、値の一致が必須であること
  end
end
