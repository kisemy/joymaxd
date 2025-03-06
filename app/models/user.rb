class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
     has_many :user_roles
  has_many :roles, through: :user_roles

  # Check if a user has a specific permission
  #def can?(action, subject_class, subject_id = nil)
  #  permissions.exists?(action: action, subject_class: subject_class, subject_id: subject_id)
#  end

  # Get all permissions for the user
 # def permissions
  #  Permission.joins(roles: :users).where(users: { id: id })
  #end     
         
         
         
         
end
