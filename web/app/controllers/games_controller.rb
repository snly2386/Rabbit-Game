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
      # flash[:error] = "#{@error}"
      render 'new'
    end
  end

  def show
    @game = RabbitDice.db.get_game(params[:id].to_i)
    @players = @game.players
    @current_player = @game.current_player
    @game_winner = @game.winner
    @last_turn = @game.turns.last
    # @dice_result = @game.turns.last.rolls.last.results
    @wounds = @last_turn.wound_count
    @score = @game.score_for(@current_player)

    flash[:success]
  end

  def winner
    @game = RabbitDice.db.get_game(params[:id].to_i)
    @winner = @game.winner 

  end
  

  def update
    move = params[:move]
    @result = RabbitDice::PlayMove.run(:game_id => params[:id].to_i, :move => params[:move]) 
    if @result.error == :game_over
      flash[:success] = "You won!"
      redirect_to "games/winner"
    elsif @result.success? 
      flash[:success] = 'You moved~!'
      redirect_to "/games/#{@result.game.id}"
    else 
      @error = @result.error
      render 'new'
    end
  end
end
