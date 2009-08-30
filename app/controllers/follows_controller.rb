class FollowsController < ApplicationController
  # GET /follows
  # GET /follows.xml
  def index
    @follows = Follow.all
    require 'twitter'
    @httpauth = Twitter::HTTPAuth.new(TWITTER_CONFIG['user_name'], TWITTER_CONFIG['password'])
    @client = Twitter::Base.new(@httpauth)
    @remote_follows = @client.friends

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /follows/1
  # GET /follows/1.xml
  def show
    require 'twitter'
    @httpauth = Twitter::HTTPAuth.new(TWITTER_CONFIG['user_name'], TWITTER_CONFIG['password'])
    @client = Twitter::Base.new(@httpauth)
    
    if params[:id].to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/)
      @follow = Follow.find(params[:id])
      @remote_follow = @client.user(@follow.twitter)
    else
      @remote_follow = @client.user(params[:id])
      @follow = Follow.find(:first, :conditions => "twitter = '" + @remote_follow.screen_name + "'")
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @follow }
    end
  end

  # GET /follows/new
  # GET /follows/new.xml
  def new
    @follow = Follow.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @follow }
    end
  end

  # GET /follows/1/edit
  def edit
    @follow = Follow.find(params[:id])
  end

  # POST /follows
  # POST /follows.xml
  def create
    @follow = Follow.new(params[:follow])

    respond_to do |format|
      if @follow.save
        flash[:notice] = 'Follow was successfully created.'
        format.html { redirect_to(@follow) }
        format.xml  { render :xml => @follow, :status => :created, :location => @follow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @follow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /follows/1
  # PUT /follows/1.xml
  def update
    @follow = Follow.find(params[:id])

    respond_to do |format|
      if @follow.update_attributes(params[:follow])
        flash[:notice] = 'Follow was successfully updated.'
        format.html { redirect_to(@follow) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @follow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.xml
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to(follows_url) }
      format.xml  { head :ok }
    end
  end
end
