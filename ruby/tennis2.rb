# frozen_string_literal: true

class TennisGame2
  def initialize(server_name, receiver_name)
    @server_name = server_name
    @receiver_name = receiver_name
    @server_points = 0
    @receiver_points = 0
  end

  def won_point(player_name)
    @server_points += 1 if player_name == @server_name
    @receiver_points += 1 if player_name == @receiver_name
  end

  def label
    %w[Love Fifteen Thirty Forty]
  end

  def score
    return label[@server_points] + '-All'                        if (@server_points == @receiver_points) && (@server_points < 3)
    return 'Deuce'                                               if (@server_points == @receiver_points) && (@server_points >= 3)
    return label[@server_points] + '-' + label[@receiver_points] if [@server_points, @receiver_points].max < 4
    return 'Win for ' + @server_name                             if (@server_points >= 4) && ((@server_points - @receiver_points) >= 2)
    return 'Win for ' + @receiver_name                           if (@receiver_points >= 4) && ((@receiver_points - @server_points) >= 2)
    return 'Advantage ' + @server_name                           if (@receiver_points >= 3) && (@server_points > @receiver_points)
    return 'Advantage ' + @receiver_name                         if (@server_points >= 3) && (@receiver_points > @server_points)

    ''
  end
end
