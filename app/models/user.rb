class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :materials

  validates_presence_of :password, :on => :create

  validates :name,
    presence: true

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    email: true

  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: 6 }

  validates :phone, presence: true

  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end

end
