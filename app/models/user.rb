class User < ApplicationRecord
  has_paper_trail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :email, presence: true

  # The role is based on job titles
  enum role: {
    customer: "customer",
    developer: "developer",
    project_manager: "project_manager"
  }, _prefix: :role

  def to_s
    email
  end
end
