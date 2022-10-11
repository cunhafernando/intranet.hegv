class User < ApplicationRecord
  rolify
  has_many :noticias, dependent: :destroy
  has_many :jornais, dependent: :destroy
  has_many :comentarios, dependent: :destroy
  has_many :ramais, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable,
          :trackable, 
          :validatable
  
  def admin?
    admin
  end
  
  validate :password_complexity

  private

  def password_complexity
    return if password.nil?

    errors.add :password, :complexity unless CheckPasswordComplexityService.call(password)
  end
end
