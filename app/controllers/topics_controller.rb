class TopicsController < ApplicationController
    def index
        @topics = Topic.sorted_list
    end
end
