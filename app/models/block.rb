class Block < ApplicationRecord
    belongs_to :user_id, class_name: :user 
    has_one :blocked_user, class_name: :user
end
