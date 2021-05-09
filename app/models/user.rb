class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (self.is_valid == false)
  end
   validates :name, uniqueness: true,
   format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/},
   presence: true

  def to_param
    name
  end
#   validates :name_kana,
#   format: { with: /\A([ァ-ン]|ー)+\z/}
#   presence: true
   validates :postcode,
   format: { with: /\A\d{7}\z/},
   presence: true

#   validates :prefecture_code, :address_city, :address_street,
#   presence: true

       include JpPrefecture
    jp_prefecture :prefecture_code

    def prefecture_name
      JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
    end

    def prefecture_name=(prefecture_name)
      self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end

end
