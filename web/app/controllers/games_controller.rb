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
    @results = @game.turns.rolls.last.results
    # @dice_result = @game.turns.last.rolls.last.results
    @wounds = @last_turn.wound_count
    @score = @game.score_for(@current_player)


    flash[:success]

    respond_to do |format|
      format.html
      format.json {render :json => {game: @game, players: @players, current_player: @current_player, wounds: @wonuds, score: @score, :results: @results}}
    end

  end

  def winner
    @game = RabbitDice.db.get_game(params[:id].to_i)
    @winner = @game.winner
    # flash[:success]

  end


  def update
    move = params[:move]
    @result = RabbitDice::PlayMove.run(:game_id => params[:id].to_i, :move => params[:move])
    @game = RabbitDice.db.get_game(params[:id].to_i)
    if @game.winner != nil
      redirect_to "/games/winner/#{@game.id}"
    elsif @result.success?
      # flash[:success] = 'You moved~!'
      redirect_to "/games/#{@result.game.id}"
    else
      @error = @result.error
      render 'new'
    end
  end
end
