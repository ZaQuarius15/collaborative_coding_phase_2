class UserEvent < ApplicationRecord
    belongs_to :participant, :class_name => :User
    belongs_to :event 

    validates :participant_id, uniqueness: { scope: :event_id }

end
