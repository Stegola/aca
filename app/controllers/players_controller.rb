class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end
  
  def new
    @player = Player.new
    @teams = Team.all
  end
  
  def create
    @player = Player.new(players_params)
    if @player.save
      flash[:notice] = "Saved"
      redirect_to player_path(@player)
      
    else 
      flash.now[:notice] = "The player #{@player.name} hasn't been created"
      render 'new'
    end
  end
  
  def edit
    @player = Player.find(params[:id])
  end  
  
  def update
    @player = Player.find(params[:id])
    if @player.update(players_params)
      flash[:notice] = "Updated"
      redirect_to player_path(@player)
    
    else 
      flash[:notice]  = "The player #{@player.name} hasn't been updated"
      render 'edit'
    end  
  end  
  
  private
  def players_params
    params.require(:player).permit(:name, :team_id)
  end
end
