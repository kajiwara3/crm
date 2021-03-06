# codig: utf-8
class User < ActiveRecord::Base
  has_many :mail_magazines, dependent: :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :name_kana, :address, :email, :password, :password_confirmation, :remember_me
  validates :name, presence: true
end

