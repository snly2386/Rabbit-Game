class GamesController < ApplicationController
  def new

  end

  def create
    players = params[:players]
    players.each do |player|
      if player == ""
        players.delete(player)
      end
    end
    
     @result = RabbitDice::CreateGame.run(:players => params[:players])
     if @result.success?
      flash[:success] = "Game has been created!"
      redirect_to "/games/#{@result.game.id}"
    else 
      @error = @result.error
      flash[:error] = "#{@error}"
      render 'new'
    end
  end

  def show
    @game = RabbitDice.db.get_game(params[:id].to_i)
  end
  

  def update
    move = params[:move]
    RabbitDice::PlayMove.run(:game_id => params[:game_id], :move => params[:move])

  end
end
