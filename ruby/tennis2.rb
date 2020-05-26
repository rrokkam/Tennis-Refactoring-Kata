# frozen_string_literal: true

class TennisGame2
  def initialize(player1_name, player2_name)
    @player1_name = player1_name
    @player2_name = player2_name
    @p1points = 0
    @p2points = 0
  end

  def won_point(player_name)
    @p1points += 1 if player_name == @player1_name
    @p2points += 1 if player_name == @player2_name
  end

  def score
    result = ''
    if (@p1points == @p2points) && (@p1points < 3)
      result = 'Love' if @p1points.zero?
      result = 'Fifteen' if @p1points == 1
      result = 'Thirty' if @p1points == 2
      result += '-All'
    end
    result = 'Deuce' if (@p1points == @p2points) && (@p1points > 2)

    p1res = ''
    p2res = ''
    if @p1points.positive? && @p2points.zero?
      p1res = 'Fifteen' if @p1points == 1
      p1res = 'Thirty' if @p1points == 2
      p1res = 'Forty' if @p1points == 3
      p2res = 'Love'
      result = p1res + '-' + p2res
    end
    if @p2points.positive? && @p1points.zero?
      p2res = 'Fifteen' if @p2points == 1
      p2res = 'Thirty' if @p2points == 2
      p2res = 'Forty' if @p2points == 3

      p1res = 'Love'
      result = p1res + '-' + p2res
    end

    if (@p1points > @p2points) && (@p1points < 4)
      p1res = 'Thirty' if @p1points == 2
      p1res = 'Forty' if @p1points == 3
      p2res = 'Fifteen' if @p2points == 1
      p2res = 'Thirty' if @p2points == 2
      result = p1res + '-' + p2res
    end
    if (@p2points > @p1points) && (@p2points < 4)
      p2res = 'Thirty' if @p2points == 2
      p2res = 'Forty' if @p2points == 3
      p1res = 'Fifteen' if @p1points == 1
      p1res = 'Thirty' if @p1points == 2
      result = p1res + '-' + p2res
    end
    result = 'Advantage ' + @player1_name if (@p1points > @p2points) && (@p2points >= 3)
    result = 'Advantage ' + @player2_name if (@p2points > @p1points) && (@p1points >= 3)
    result = 'Win for ' + @player1_name if (@p1points >= 4) && (@p2points >= 0) && ((@p1points - @p2points) >= 2)
    result = 'Win for ' + @player2_name if (@p2points >= 4) && (@p1points >= 0) && ((@p2points - @p1points) >= 2)
    result
  end
end
