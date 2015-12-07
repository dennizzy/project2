class TeamsController < ApplicationController
	# NHO: CanCanCan, nice! How could we utilize CanCanCan's helpers to dry up our controllers code?
	def index
		@teams = Team.all
	end

  	def new
    	@team = Team.new
    	authorize! :create, @team
	end

  	def create
	    @team = Team.new(team_params)
	    authorize! :create, @team
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

	def edit
		@team = Team.find(params[:id])
		authorize! :update, @team
	end

	def update
		@team = Team.find(params[:id])
		authorize! :update, @team
		if @team.update(team_params)
		  flash[:notice] = "#{@team.school_name} was successfully updated."
		  redirect_to @team
		else
		  render :edit
		end
	end

  	def destroy
	    @team = Team.find(params[:id])
	    authorize! :destroy, @team
	    @team.destroy
	    redirect_to teams_path
  	end

	private
		def team_params
		params.require(:team).permit(:school_name, :photo_url, :state)
	end

end
