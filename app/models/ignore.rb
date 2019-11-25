class Ignore < ApplicationRecord
    belongs_to :user_id, class_name: :user 
    belongs_to :ignored_user, class_name: :user
end
