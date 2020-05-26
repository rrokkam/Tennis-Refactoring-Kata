# frozen_string_literal: true

module Score
  class Deuce
    def to_str
      'Deuce'
    end

    def server_point
      ServerAdvantage.new
    end

    def receiver_point
      ReceiverAdvantage.new
    end
  end

  class ServerWon
    def to_str
      'Win for player1'
    end
  end

  class ReceiverWon
    def to_str
      'Win for player2'
    end
  end

  class ServerAdvantage
    def to_str
      'Advantage player1'
    end

    def server_point
      ServerWon.new
    end

    def receiver_point
      Deuce.new
    end
  end

  class ReceiverAdvantage
    def to_str
      'Advantage player2'
    end

    def server_point
      Deuce.new
    end

    def receiver_point
      ReceiverWon.new
    end
  end

  class Regular
    def initialize
      @server_points = 0
      @receiver_points = 0
    end

    def to_str
      return names[@server_points] + '-All' if @server_points == @receiver_points

      names[@server_points] + '-' + names[@receiver_points]
    end

    def names
      {
        0 => 'Love',
        1 => 'Fifteen',
        2 => 'Thirty',
        3 => 'Forty'
      }
    end

    def server_point
      @server_points += 1
      score
    end

    def receiver_point
      @receiver_points += 1
      score
    end

    def score
      return Deuce.new if @server_points == 3 && @receiver_points == 3
      return ServerWon.new if @server_points == 4
      return ReceiverWon.new if @receiver_points == 4

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
