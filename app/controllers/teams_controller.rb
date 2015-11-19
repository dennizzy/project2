class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

  	def new
    	@team = Team.new
    	authorize! :create, @team
	end

  	def create
	    @team = Team.new(team_params)
	    authorize! :create, @article
	    if @team.save
	      flash[:notice] = "#{@team.school_name} was successfully created."
	      redirect_to @team
	    else
	      render :new
	    end
  	end

  	def show
    	@team = Team.find(params[:id])
    	authorize! :read, @team
	end

  	def destroy
	    @team = Team.find(params[:id])
	    authorize! :destroy, @article
	    @team.destroy
	    redirect_to teams_path
  	end

	private
		def team_params
		params.require(:team).permit(:school_name, :photo_url, :state)
	end

end