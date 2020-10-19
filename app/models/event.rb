class Event < ApplicationRecord
    belongs_to :host, :class_name => :User
    belongs_to :lang_topic
    has_many :participants, :class_name => :User
end
