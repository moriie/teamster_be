class User < ApplicationRecord

    has_secure_password

    has_many :goals
    has_many :partner_goals, class_name: 'Goal', as: :partner
    has_one :network
    has_many :network_goals, through: :network, source: :partner, source_type: 'Goal'
    has_many :ignores

    validates :age, numericality: { only_integer: true, message: 'must be an number.' }
    validates :age, numericality: { greater_than: 17, message: 'must be 18 or older to use this application.' }
    validates :email, format: { with: /\S+@[a-z0-9]+.[a-z]+/i }, uniqueness: { case_sensitive: false }
    validates :bio, length: { maximum: 180 }
    validates :location, format: { with: /[0-9]{5}/, message: 'must be standard 5 digit US zip code' }
    validates :first_name, format: { with: /[A-Z][a-z]+/, message: 'can only include letters'}
    validates :last_name, format: { with: /[a-z][A-Z]+/, message: 'can only include letters'}
end
