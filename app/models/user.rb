class User < ApplicationRecord
    has_many :events, :foreign_key => 'host_id', as: :hosting
    has_many :languages, through: :events
    
    has_many :user_events, :foreign_key => 'participant_id'
    has_many :events, through: :user_events, as: :attending


    has_secure_password

    validates :name, presence: true
    validates :bio, presence: true

    def events_attending
        UserEvent.all.select {|ue| ue.participant_id == self.id}
    end

    def events_hosting
        Event.all.select {|e| e.host_id == self.id}
    end

end
