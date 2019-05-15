class User < ApplicationRecord
  before_create :set_default_role
  belongs_to :role,  optional: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end
