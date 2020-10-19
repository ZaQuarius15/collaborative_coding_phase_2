class LangTopicsController < ApplicationController

    def index
        @lang_topics = LangTopics.all 
    end
    
end
