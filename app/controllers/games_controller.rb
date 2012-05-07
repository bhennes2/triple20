class GamesController < ApplicationController
  
  def index
    @title = "Trips 20"
    @games = Game.all
  end
  
  def new
    @title = "Trips 20 | New Game"
    @game = Game.new
  end
  
  def create
    game = Game.new
    game.player1 = params[:game][:player1]
    game.player2 = params[:game][:player2]
    game.save
    
    redirect_to live_game_url(game.id)
  end
  
  def show
    @game = Game.find_by_id(params[:id])
  end
  
  def destroy
    game = Game.find_by_id(params[:id])
    game.destroy
    
    redirect_to games_url
  end
  
  def edit
    @title = "Edit game # #{params[:id]}"
    @game = Game.find_by_id(params[:id])
  end
  
  def update
    game = Game.find_by_id(params[:id])
    game.update_attributes(params[:game])
    
    redirect_to game_url(params[:id])
  end
  
  def live
    @title = 'Game in progress'
    @game = Game.find_by_id(params[:id])
  end
  
  def winner
    @game = Game.find_by_id(params[:id])
    
    @game.player1_score = params[:p1score]
    @game.player2_score = params[:p2score]
    
    if params[:p1score] > params[:p2score]
      @game.winner = 1
    else
      @game.winner = 2
    end
    
    @game.save
    
    respond_to do |format|
      format.js
    end

  end
  
end