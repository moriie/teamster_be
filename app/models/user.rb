class User < ApplicationRecord

    has_secure_password

    has_many :goals
    has_many :partner_goals, class_name: 'Goal', as: :partner
    has_one :network
    has_many :network_goals, through: :network, source: :partner, source_type: 'Goal'

    validates :username, uniqueness: { case_sensitive: true, message: 'Username already exists.' }, length: { minimum: 4, maximum: 14 }
    validates :age, exclusion: { in: 0..18, message: 'You must be 18 years or older to use this app.' }
    validates :email, format: { with: /\S+@[a-z]+.com/i, message: 'Incorrect email format.' }, uniqueness: { case_sensitive: false, message: 'There is already an account associated with this email.' }
    validates :bio, length: { maximum: 180 }
    validates :location, format: { with: /[0-9]{5}/, message: 'Please only enter 5 numbers for zip code.' }
    
end
