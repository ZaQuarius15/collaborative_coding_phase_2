class Event < ApplicationRecord
    belongs_to :host, :class_name => :User
    belongs_to :lang_topic
    has_many :participants, :class_name => :User

    attr_reader :language, :topic

    def language
        self.lang_topic.language
    end

    def topic
        self.lang_topic.topic
    end
end
