# frozen_string_literal: true

module Tennis2
  class Player
    def initialize(name)
      @name = name
      @points = 0
    end

    attr_reader :name
    attr_reader :points

    def score_point
      @points += 1
    end
  end
end

class TennisGame2
  def initialize(server_name, receiver_name)
    @server = Tennis2::Player.new(server_name)
    @receiver = Tennis2::Player.new(receiver_name)
  end

  def won_point(name)
    @server.score_point   if name == @server.name
    @receiver.score_point if name == @receiver.name
  end

  def label
    %w[Love Fifteen Thirty Forty]
  end

  def score
    return label[@server.points] + '-All'                        if (@server.points < 3)    && ((@server.points - @receiver.points) == 0)
    return 'Deuce'                                               if (@server.points >= 3)   && ((@receiver.points - @server.points) == 0)
    return label[@server.points] + '-' + label[@receiver.points] if [@server.points, @receiver.points].max < 4
    return 'Win for ' + @server.name                             if (@server.points >= 4)   && ((@server.points - @receiver.points) >= 2)
    return 'Win for ' + @receiver.name                           if (@receiver.points >= 4) && ((@receiver.points - @server.points) >= 2)
    return 'Advantage ' + @server.name                           if (@server.points >= 4)   && ((@server.points - @receiver.points) == 1)
    return 'Advantage ' + @receiver.name                         if (@receiver.points >= 4) && ((@receiver.points - @server.points) == 1)

    ''
  end
end
