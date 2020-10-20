class Topic < ApplicationRecord
    has_many :lang_topics
    has_many :events, through: :lang_topics

    def sorted_list(language_topics)
        language_topics.sort {|a, b| a.title <=> b.title}
    end
end
