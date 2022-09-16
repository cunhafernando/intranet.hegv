class User < ApplicationRecord
  rolify
  has_many :noticias, dependent: :destroy
  has_many :jornais, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :confirmable,
          :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable,
          :trackable, 
          :validatable
  
  def admin?
    admin
  end
end
