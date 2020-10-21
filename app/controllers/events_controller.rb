class EventsController < ApplicationController

    # before_action :require_logged_in
    # skip_before_action :require_logged_in, only: [:create]
     
    def index

        if params[:topic]
            @events = Event.all.select do |e|
                if e.language = params[:language] 
                    e.topic = params[:topic]
                end
            end
            @lang = Language.all.find(params[:language])
            @topic = Topic.all.find(params[:topic])
        else
            @events = Event.all
        end
    end
    
    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
        @lang_topics = LangTopic.all
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to events_path(@event)
        elsif  
            flash[:errors] = @event.errors.full_messages
            redirect_to new_event_path
        end
    end

    private

    def event_params
        params.require(:event).permit(:lang_topic_id, :location, :date, :time)
    end


end
