# frozen_string_literal: true

module Score
  class Tied
    def initialize(points)
      @points = points
    end

    def to_str
      {
        0 => 'Love-All',
        1 => 'Fifteen-All',
        2 => 'Thirty-All'
      }.fetch(@points, 'Deuce')
    end
  end

  class AdvantageOrWon
    def initialize(server_points, receiver_points)
      @server_points = server_points
      @receiver_points = receiver_points
    end

    def to_str
      minus_result = @server_points - @receiver_points
      if minus_result == 1
        'Advantage player1'
      elsif minus_result == -1
        'Advantage player2'
      elsif minus_result >= 2
        'Win for player1'
      else
        'Win for player2'
      end
    end
  end

  class Regular
    def initialize(server_points, receiver_points)
      @server_points = server_points
      @receiver_points = receiver_points
    end

    def to_str
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
  end
end

module Tennis
  class GameScore
    def initialize
      @server_points = 0
      @receiver_points = 0
    end

    def server_scored
      @server_points += 1
      self
    end

    def receiver_scored
      @receiver_points += 1
      self
    end

    def score
      return Score::Tied.new(@server_points) if tied?
      return Score::AdvantageOrWon.new(@server_points, @receiver_points) if advantage_or_won?

      Score::Regular.new(@server_points, @receiver_points)
    end

    def to_str
      score.to_str
    end

    def tied?
      @server_points == @receiver_points
    end

    def advantage_or_won?
      @server_points >= 4 or @receiver_points >= 4
    end
  end
end

class TennisGame1
  def initialize(server_name, receiver_name)
    @server_name = server_name
    @receiver_name = receiver_name
    @score = Tennis::GameScore.new
  end

  def won_point(name)
    @score = @score.server_scored if name == @server_name
    @score = @score.receiver_scored if name == @receiver_name
  end

  def score
    @score.to_str
  end
end
