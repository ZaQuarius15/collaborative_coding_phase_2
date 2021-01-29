class Topic < ApplicationRecord
    has_many :lang_topics
    has_many :events, through: :lang_topics

    def self.sorted_list
        all.sort {|a, b| a.title <=> b.title}
    end
end
