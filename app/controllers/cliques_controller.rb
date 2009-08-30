class CliquesController < ApplicationController
  # GET /cliques
  # GET /cliques.xml
  def index
    @cliques = Clique.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cliques }
    end
  end

  # GET /cliques/1
  # GET /cliques/1.xml
  def show
    @clique = Clique.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clique }
    end
  end

  # GET /cliques/new
  # GET /cliques/new.xml
  def new
    @clique = Clique.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clique }
    end
  end

  # GET /cliques/1/edit
  def edit
    @clique = Clique.find(params[:id])
  end

  # POST /cliques
  # POST /cliques.xml
  def create
    @clique = Clique.new(params[:clique])

    respond_to do |format|
      if @clique.save
        flash[:notice] = 'Clique was successfully created.'
        format.html { redirect_to(@clique) }
        format.xml  { render :xml => @clique, :status => :created, :location => @clique }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cliques/1
  # PUT /cliques/1.xml
  def update
    @clique = Clique.find(params[:id])

    respond_to do |format|
      if @clique.update_attributes(params[:clique])
        flash[:notice] = 'Clique was successfully updated.'
        format.html { redirect_to(@clique) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clique.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cliques/1
  # DELETE /cliques/1.xml
  def destroy
    @clique = Clique.find(params[:id])
    @clique.destroy

    respond_to do |format|
      format.html { redirect_to(cliques_url) }
      format.xml  { head :ok }
    end
  end
end
