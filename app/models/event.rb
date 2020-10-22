class Event < ApplicationRecord
    belongs_to :host, :class_name => :User
    belongs_to :lang_topic
    has_many :participants, :class_name => :User
    
    attr_reader :language, :topic

    def attendees_count
        user_events = UserEvent.all.select {|ue| ue.event_id == self.id}
        user_events.map {|event| event.participant_id}.count
    end

    def display_time
        split_time = self.time.to_s.split
        time = split_time[1].split(":")
        if time[0].to_i <= 12  
            time_hour = time[0].to_i
            ap = "AM"
        else
            time_hour = time[0].to_i - 12
            ap = "PM"
        end
        time_minutes = time[1].to_i
        return "#{time_hour}:#{time_minutes} #{ap}"
    end

    def display_date
        split_date = self.date.to_s.split("-")
        month = split_date[1]
        day = split_date[2]
        year = split_date[0]
        return "#{month}/#{day}/#{year}"
    end


    def self.sort_by_date
        all.sort { |a,b| [a.date, a.time] <=> [b.date, b.time] }
    end

    def language
        self.lang_topic.language
    end

    def topic
        self.lang_topic.topic
    end
end
