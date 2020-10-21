class Event < ApplicationRecord
    belongs_to :host, :class_name => :User
    belongs_to :lang_topic
    has_many :participants, :class_name => :User
    attr_reader :language, :topic

    after_save :set_host 
    
      def set_host
        @user = User.find(self.host_id)
        unless @user.is_host?
          @user.update(is_host: true)
        end
      end


    def language
        self.lang_topic.language
    end

    def topic
        self.lang_topic.topic
    end
end
