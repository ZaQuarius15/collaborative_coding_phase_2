class EventsController < ApplicationController

    before_action :require_logged_in
     
    def index
        if params[:topic] && !params[:language]
            @events = Event.sort_by_date.select do |e|
                e.topic == Topic.find(params[:topic])
            end
            @topic = Topic.find(params[:topic])
        elsif params[:topic]
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
        @user_event = UserEvent.find_by(event_id: params[:id])
    end

    def new
        @event = Event.new
        @lang_topics = LangTopic.all
        @times = Event.times
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

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @lang_topics = LangTopic.all
        @event = Event.find(params[:id])
        @event.update(event_params)
        flash[:success] = ["#{@event.title} has been updated."]
        redirect_to event_path(@event)
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

    def cancel_join
        @event = Event.find(params[:id])
        @user_event = UserEvent.find_by(event_id: @event.id)
        current_user.user_events.delete_by(params[:event_id])
        redirect_to controller:'welcome', action: 'home'
    end

    def destroy
        @event = Event.find(params[:id])
        @event.delete
        flash[:notice] = ["#{@event.title} has been deleted."]
        redirect_to controller: 'welcome', action: 'home'
    end

    private

    def event_params
        params.require(:event).permit(:title, :lang_topic_id, :location, :date, :time)
    end


end