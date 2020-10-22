class EventsController < ApplicationController

    before_action :require_logged_in
     
    def index
        if params[:topic]
            @events = Event.sort_by_date.select do |e|
                if e.language == Language.find(params[:language])
                    e.topic == Topic.find(params[:topic])
                end
            end
            @lang = Language.all.find(params[:language])
            @topic = Topic.all.find(params[:topic])
        elsif params[:language]
            @events = Event.sort_by_date.select do |e|
                e.language == Language.find(params[:language])
            end
            @lang = Language.all.find(params[:language])
        else
            @events = Event.sort_by_date
        end
    end
    
    def show
        @event = Event.find(params[:id])
        @language = @event.language
        @topic = @event.topic
        @host = User.find(@event.host_id)
    end

    def new
        @event = Event.new
        @lang_topics = LangTopic.all
    end

    def create
        @event = Event.create(event_params.merge(:host_id => session[:user_id]))
        if @event.save
            redirect_to events_path(@event)
        elsif  
            flash[:errors] = @event.errors.full_messages
            redirect_to new_event_path
        end
    end

    def join
        @event = Event.find(params[:id])
        @user_event = UserEvent.create(:event_id => @event.id, :participant_id => current_user.id)
            if @user_event.save
                current_user.user_events << @user_event
                redirect_to controller: 'welcome', action: 'home'
            else 
                flash[:errors] = ["You've already registered for this event!"]
                redirect_to event_path
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :lang_topic_id, :location, :date, :time)
    end


end