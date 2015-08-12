class User < ActiveRecord::Base
  has_and_belongs_to_many :materials

  has_secure_password
  validates_presence_of :password, :on => :create

  validates :name, presence: true
  validates :email, presence: true
end
