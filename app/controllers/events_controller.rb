class EventsController < ApplicationController
     
    def index
        if params[:topic]
            @events = Event.all.select do |e|
                if e.language == Language.find(params[:language])
                    e.topic == Topic.find(params[:topic])
                end
            end
            @lang = Language.all.find(params[:language])
            @topic = Topic.all.find(params[:topic])
        elsif params[:language]
            @events = Event.all.select do |e|
                e.language == Language.find(params[:language])
            end
            @lang = Language.all.find(params[:language])
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
        @event = Event.new(event_params.merge(:host_id => session[:user_id]))
        if @event.save
            redirect_to events_path(@event)
        elsif  
            flash[:errors] = @event.errors.full_messages
            redirect_to new_event_path
        end
    end


    private

    def event_params
        params.require(:event).permit(:title, :lang_topic_id, :location, :date, :time)
    end


end