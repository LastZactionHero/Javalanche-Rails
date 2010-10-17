class HighScoresController < ApplicationController
  # GET /high_scores
  # GET /high_scores.xml
  def index
    @high_scores = HighScore.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @high_scores }
    end
  end

  # GET /high_scores/1
  # GET /high_scores/1.xml
  def show
    @high_score = HighScore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @high_score }
    end
  end

  # GET /high_scores/new
  # GET /high_scores/new.xml
  def new
    @high_score = HighScore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @high_score }
    end
  end

  # GET /high_scores/1/edit
  def edit
    @high_score = HighScore.find(params[:id])
  end

  # POST /high_scores
  # POST /high_scores.xml
  def create
    @high_score = HighScore.new(params[:high_score])

    respond_to do |format|
      if @high_score.save
        format.html { redirect_to(@high_score, :notice => 'High score was successfully created.') }
        format.xml  { render :xml => @high_score, :status => :created, :location => @high_score }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @high_score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /high_scores/1
  # PUT /high_scores/1.xml
  def update
    @high_score = HighScore.find(params[:id])

    respond_to do |format|
      if @high_score.update_attributes(params[:high_score])
        format.html { redirect_to(@high_score, :notice => 'High score was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @high_score.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /high_scores/1
  # DELETE /high_scores/1.xml
  def destroy
    @high_score = HighScore.find(params[:id])
    @high_score.destroy

    respond_to do |format|
      format.html { redirect_to(high_scores_url) }
      format.xml  { head :ok }
    end
  end
  
  # Get Add New Score from Game
  def add_new
   
    puts "Adding New High Score"
    puts "Name:    " + params[:name]
    puts "Comment: " + params[:comment]
    puts "Score:   " + params[:score]
    
    @new_score = HighScore.new()
    @new_score.name = params[:name]
    @new_score.comment = params[:comment]
    @new_score.score = params[:score]
    currentDate = Time.new
    @new_score.date = currentDate.strftime( "%Y-%m-%d" )
    
    @new_score.save
    
    respond_to do |format|
      format.html { redirect_to(high_scores_url) }
      format.xml  { head :ok }
    end
  end
  
  # Get the Top Ten High Scores
  def top_ten
  	@high_scores_top = HighScore.find( :all, :limit=>10, :order=>"score DESC" )
  	
  	@high_scores_top.each do |score|
  		puts score.score
  	end
  	
    #respond_to do |format|
    #  format.html { redirect_to(high_scores_url) }
    #  format.xml  { head :ok }
    #end  
  end
  
end
