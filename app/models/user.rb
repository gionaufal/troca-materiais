class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :address, :city, :uf, :zipcode, :email, presence: true
  has_many :wishes
  has_many :materials
  has_many :notifications, dependent: :destroy

  def notify(other_user, match)
    Notification.create(user_id: other_user.id,
                        notified_by_id: id,
                        match_id: match.id,
                        read: false)
  end
end
