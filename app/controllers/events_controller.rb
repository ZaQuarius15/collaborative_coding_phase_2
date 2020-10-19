class EventsController < ApplicationController
     
    def index
        @events = Event.all
    end
    
    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
        @lang_topics = LangTopic.all
    end

    def create
        event = Event.create(event_params)
        if event.save
            redirect_to events_path
        elsif  
            flash[:errors] = event.errors.full_messages
            redirect_to new_event_path
        end
    end

    private

    def event_params
        params.require(:event).permit(:host_id, :lang_topic_id, :location, :date, :time)
    end


end
