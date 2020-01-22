class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]


  has_one :card
  has_many :items
  has_many :comments
  has_one :evaluation
  has_many :sns_credentials

    #バリデーション
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :nickname,                presence: true, length: {maximum: 20}
    validates :email,                   {presence: true, format: { with: VALID_EMAIL_REGEX }}
    validates :last_name,               presence: true
    validates :first_name,              presence: true
    validates :last_name_kana,          presence: true
    validates :first_name_kana,         presence: true
    validates :birthdate_year,          numericality: true
    validates :birthdate_month,         numericality: true
    validates :birthdate_day,           numericality: true
    validates :phone_number,            {presence: true, format: { with: VALID_PHONE_REGEX }}
    validates :address_number,          {presence: true ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}}
    validates :address_prefecture,      presence: true
    validates :address_name,            presence: true
    validates :address_block,           presence: true
    validates :address_phone_number,    {allow_blank: true, format: { with: VALID_PHONE_REGEX }}


    enum address_prefecture: {
      北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
      茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
      新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
      岐阜県:21,静岡県:22,愛知県:23,三重県:24,
      滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
      鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
      徳島県:36,香川県:37,愛媛県:38,高知県:39,
      福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
      }


    def self.find_oauth(auth)
      uid = auth.uid
      provider = auth.provider
      snscredential = SnsCredential.where(uid: uid, provider: provider).first
      if snscredential.present?
        user = User.where(id: snscredential.user_id).first
      else
        user = User.where(email: auth.info.email).first
        if user.present?
          SnsCredential.create(
            uid: uid,
            provider: provider,
            user_id: user.id
            )
        else
          user = User.create(
            nickname: auth.info.name,
            email:    auth.info.email,
            password: Devise.friendly_token[0, 20]
            )
          SnsCredential.create(
            uid: uid,
            provider: provider,
            user_id: user.id
            )
        end
      end
      return user
    end
end
