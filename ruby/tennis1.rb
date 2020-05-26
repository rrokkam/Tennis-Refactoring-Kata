# frozen_string_literal: true

module Score
  class Deuce
    def to_str;         'Deuce' end
    def server_point;   ServerAdvantage.new end
    def receiver_point; ReceiverAdvantage.new end
  end

  class ServerWin
    def to_str;         'Win for player1' end
  end

  class ReceiverWin
    def to_str;         'Win for player2' end
  end

  class ServerAdvantage
    def to_str;         'Advantage player1' end
    def server_point;   ServerWin.new end
    def receiver_point; Deuce.new end
  end

  class ReceiverAdvantage
    def to_str;         'Advantage player2' end
    def server_point;   Deuce.new end
    def receiver_point; ReceiverWin.new end
  end

  class Regular
    def initialize
      @server_points = 0
      @receiver_points = 0
    end

    def to_str
      return label[@server_points] + '-All' if @server_points == @receiver_points

      label[@server_points] + '-' + label[@receiver_points]
    end

    def server_point
      @server_points += 1
      score
    end

    def receiver_point
      @receiver_points += 1
      score
    end

    def label
      %w[Love Fifteen Thirty Forty Win]
    end

    def score
      return Deuce.new       if to_str == 'Forty-All'
      return ServerWin.new   if label[@server_points] == 'Win'
      return ReceiverWin.new if label[@receiver_points] == 'Win'

      self
    end
  end
end

class TennisGame1
  def initialize(server, receiver)
    @server = server
    @receiver = receiver
    @score = Score::Regular.new
  end

  def won_point(player)
    @score = @score.server_point if player == @server
    @score = @score.receiver_point if player == @receiver
  end

  def score
    @score.to_str
  end
end
