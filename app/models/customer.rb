class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :recipes
    has_many :comments
    has_many :bookmarks, dependent: :destroy
    def self.guest
      find_or_create_by!(email: 'guest@example.com') do |customer|
        customer.password = SecureRandom.urlsafe_base64
      end
    end
end
