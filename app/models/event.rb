class Event < ApplicationRecord
    belongs_to :host, :class_name => :User
    belongs_to :lang_topic
    has_many :participants, :class_name => :User

    validates_date :date, on_or_after: lambda { Date.current }, on_or_after_message: "of Meetup cannot be in the past."
    
    attr_reader :language, :topic

    @@times = ["12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM", "12:00 PM"]
    
    def attendees_count
        user_events = UserEvent.all.select {|ue| ue.event_id == self.id}
        user_events.map {|event| event.participant_id}.count
    end

    def display_date
        split_date = self.date.to_s.split("-")
        month = split_date[1]
        day = split_date[2]
        year = split_date[0]
        return "#{month}/#{day}/#{year}"
    end


    def self.sort_by_date
        all.sort { |a,b| [a.date, a.time.to_time] <=> [b.date, b.time.to_time] }
    end

    def language
        self.lang_topic.language
    end

    def topic
        self.lang_topic.topic
    end

    def self.times
        @@times
    end

end