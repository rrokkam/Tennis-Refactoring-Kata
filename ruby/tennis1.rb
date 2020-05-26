# frozen_string_literal: true

module Score
  class TiedRegular
    def initialize(points)
      @points = points
    end

    def to_str
      {
        0 => 'Love-All',
        1 => 'Fifteen-All',
        2 => 'Thirty-All'
      }.fetch(@points, nil)
    end
  end

  class Deuce
    def to_str
      'Deuce'
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
  end

  class ReceiverAdvantage
    def to_str
      'Advantage player2'
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

class TennisGame1
  def initialize(server_name, receiver_name)
    @server_name = server_name
    @receiver_name = receiver_name
    @server_points = 0
    @receiver_points = 0
    @score = Score::TiedRegular.new(0)
  end

  def won_point(name)
    @server_points += 1 if name == @server_name
    @receiver_points += 1 if name == @receiver_name
    @score = update_score
  end

  def update_score
    return Score::TiedRegular.new(@server_points).to_str if tied_not_deuce?
    return Score::ServerAdvantage.new.to_str if server_advantage?
    return Score::ReceiverAdvantage.new.to_str if receiver_advantage?
    return Score::ServerWon.new.to_str if server_won?
    return Score::ReceiverWon.new.to_str if receiver_won?
    return Score::Deuce.new.to_str if deuce?

    Score::Regular.new(@server_points, @receiver_points).to_str
  end

  def score
    @score.to_str
  end

  def diff
    @server_points - @receiver_points
  end

  def both_more_than_forty
    @server_points >= 4 or @receiver_points >= 4
  end

  def deuce?
    diff.zero? and @server_points >= 3
  end

  def tied_not_deuce?
    diff.zero? and !deuce?
  end

  def receiver_advantage?
    both_more_than_forty and diff == -1
  end

  def server_advantage?
    both_more_than_forty and diff == 1
  end

  def receiver_won?
    both_more_than_forty and diff < -1
  end

  def server_won?
    both_more_than_forty and diff > 1
  end
end
