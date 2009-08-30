class TimelinesController < ApplicationController
  # GET /timelines
  # GET /timelines.xml
  def index
    @httpauth = Twitter::HTTPAuth.new(TWITTER_CONFIG['user_name'], TWITTER_CONFIG['password'])
    @client = Twitter::Base.new(@httpauth)
    @friends_timeline = @client.friends_timeline
    
    @follows = Follow.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @timelines }
    end
  end
end
