class User < ApplicationRecord
    has_many :events, :foreign_key => 'host_id'
    has_many :languages, through: :events
    
    has_many :user_events, :foreign_key => 'participant_id'
    has_many :events, through: :user_events

    validates :name, presence: true
    validates :password, presence: true
    validates :bio, length: { minimum: 20 }


end
