class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :facilitator_group_id, :admin, :educator, :username

  belongs_to :facilitator_group
  has_one :facilitator
  has_many :student_group_users, :dependent => :destroy


  def full_name
	[first_name, last_name].join(" ")
  end

end
