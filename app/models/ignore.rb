class Ignore < ApplicationRecord
    belongs_to :user_id, class_name: :user 
    has_one :ignored_user, class_name: :user
end
