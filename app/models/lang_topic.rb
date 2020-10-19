class LangTopic < ApplicationRecord
    belongs_to :language
    belongs_to :topic
    has_many :events

    attr_reader :display_lt

    def initilaize
        super
        @display_lt = self.display_lt
    end

    def display_lt
        self.language.name.to_s + " - " + self.topic.title.to_s
    end
end
