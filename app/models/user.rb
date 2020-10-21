class User < ApplicationRecord
    has_many :events, :foreign_key => 'host_id'
    has_many :languages, through: :events
    
    has_many :user_events, :foreign_key => 'participant_id'
    has_many :events, through: :user_events


    has_secure_password

    validates :name, presence: true
    validates :bio, presence: true

    # devise :rememberable, :omniauthable, omniauth_providers: [:google_oauth2]

end
