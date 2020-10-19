class LangTopicsController < ApplicationController

    def index
        @lang_topics = LangTopic.all
    end

end
