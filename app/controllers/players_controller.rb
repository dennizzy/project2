class PlayersController < ApplicationController
	  # index
	def index
		@players = Player.all
	end

	# new
	def new
		@team = Team.find(params[:team_id])
		@player = Player.new
	end

	# create
	def create
		@team = Team.find(params[:team_id])
		@player = @team.players.new(player_params)
		if @player.save
		  flash[:notice] = "#{@player.name} was successfully created."
		  redirect_to @player
		else
		  render :new
		end
	end

	#show
	def show
		@player = Player.find(params[:id])
		@team = @player.team
	end

	# edit
	def edit
		@player = Player.find(params[:id])
		@team = @player.team
	end

	# update
	def update
		@player = Player.find(params[:id])
		@team = @player.team
		if @player.update(player_params)
		  flash[:notice] = "#{@player.name} was successfully updated."
		  redirect_to @player
		else
		  render :edit
		end
	end

	# destroy
	def destroy
		@player = Player.find(params[:id])
		@player.destroy
		redirect_to @player.team
	end

	private
	def player_params
		params.require(:player).permit(:name, :photo_url, :position, :year, :age)
	end

end
# code looks good to me!!!
