class Language < ApplicationRecord
    has_many :lang_topics
    has_many :events, through: :lang_topics

    def self.sorted_list
        all.sort {|a, b| a.name <=> b.name}
    end

    def topics
        self.lang_topics.map { |lt| lt.topic }.sort { |a,b| a.title <=> b.title } 
    end
end
