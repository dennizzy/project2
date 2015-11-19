class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

  	def new
    	@team = Team.new
	end

  	def create
	    @team = Team.new(team_params)
	    if @team.save
	      flash[:notice] = "#{@team.name} was successfully created."
	      redirect_to @team
	    else
	      render :new
	    end
  	end

  	def show
    	@team = Team.find(params[:id])
	end

end