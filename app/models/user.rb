class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many:articales


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

end
