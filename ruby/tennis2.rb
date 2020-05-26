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

  def label
    %w[Love Fifteen Thirty Forty]
  end

  def score
    result = ''
    return label[@p1points] + '-All' if (@p1points == @p2points) && (@p1points < 3)
    return 'Deuce' if (@p1points == @p2points) && (@p1points >= 3)
    return label[@p1points] + '-' + label[@p2points] if [@p1points, @p2points].max < 4

    result = 'Advantage ' + @player1_name if (@p1points > @p2points) && (@p2points >= 3)
    result = 'Advantage ' + @player2_name if (@p2points > @p1points) && (@p1points >= 3)
    result = 'Win for ' + @player1_name if (@p1points >= 4) && (@p2points >= 0) && ((@p1points - @p2points) >= 2)
    result = 'Win for ' + @player2_name if (@p2points >= 4) && (@p1points >= 0) && ((@p2points - @p1points) >= 2)
    result
  end
end
