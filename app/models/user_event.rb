class UserEvent < ApplicationRecord
    belongs_to :participant, :class_name => :User
    belongs_to :event 
end
