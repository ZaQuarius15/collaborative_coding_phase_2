class Topic < ApplicationRecord
    has_many :lang_topics
    has_many :events, through: :lang_topics
end
