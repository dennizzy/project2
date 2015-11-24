class PlayersController < ApplicationController
	# NHO: CanCanCan, nice! How could we utilize CanCanCan's helpers to dry up our controllers code?
	def index
		@players = Player.all
	end

	def new
		@team = Team.find(params[:team_id])
		@player = Player.new
		authorize! :create, @player
	end

	def create
		@team = Team.find(params[:team_id])
		@player = @team.players.new(player_params)
		authorize! :create, @player
		if @player.save
		  flash[:notice] = "#{@player.name} was successfully created."
		  redirect_to @player
		else
		  render :new
		end
	end

	def show
		@player = Player.find(params[:id])
		@team = @player.team
	end

	def edit
		@player = Player.find(params[:id])
		@team = @player.team
		authorize! :update, @player
	end

	# update
	def update
		@player = Player.find(params[:id])
		@team = @player.team
		authorize! :update, @player
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
		authorize! :destroy, @player
		@player.destroy
		redirect_to @player.team
	end

	def add_favorite
		@player = Player.find(params[:id])
		@team = @player.team
		@player.favorites.create(user: current_user)
		redirect_to team_path(@player.team)
	end

	def remove_favorite
		@player = Player.find(params[:id])
		@team = @player.team
		@player.favorites.where(user: current_user).destroy_all
		redirect_to team_path(@team)
	end


	private
	def player_params
		params.require(:player).permit(:name, :photo_url, :position, :year, :age)
	end

end
