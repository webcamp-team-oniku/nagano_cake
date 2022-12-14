class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries
  has_many :cart_items
  has_many :orders

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postcode, presence: true
  validates :telephone_number, presence: true
  validates :address, presence: true
  validates :email, presence: true

  def full_name
    self.last_name + self.first_name
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

end
