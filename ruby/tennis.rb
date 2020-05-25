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

    def to_str
      return tied_score if tied?
      return advantage_or_won_score if advantage_or_won?

      regular_score
    end

    def tied?
      @server_points == @receiver_points
    end

    def tied_score
      {
        0 => 'Love-All',
        1 => 'Fifteen-All',
        2 => 'Thirty-All'
      }.fetch(@server_points, 'Deuce')
    end

    def advantage_or_won?
      @server_points >= 4 or @receiver_points >= 4
    end

    def advantage_or_won_score
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

    def regular_score
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

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ""
    if (@p1points == @p2points and @p1points < 3)
      if (@p1points == 0)
        result = "Love"
      end
      if (@p1points == 1)
        result = "Fifteen"
      end
      if (@p1points == 2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1points == @p2points and @p1points > 2)
      result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points == 0)
      if (@p1points == 1)
        p1res = "Fifteen"
      end
      if (@p1points == 2)
        p1res = "Thirty"
      end
      if (@p1points == 3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0 and @p1points == 0)
      if (@p2points == 1)
        p2res = "Fifteen"
      end
      if (@p2points == 2)
        p2res = "Thirty"
      end
      if (@p2points == 3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points > @p2points and @p1points < 4)
      if (@p1points == 2)
        p1res = "Thirty"
      end
      if (@p1points == 3)
        p1res = "Forty"
      end
      if (@p2points == 1)
        p2res = "Fifteen"
      end
      if (@p2points == 2)
        p2res = "Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2points > @p1points and @p2points < 4)
      if (@p2points == 2)
        p2res = "Thirty"
      end
      if (@p2points == 3)
        p2res = "Forty"
      end
      if (@p1points == 1)
        p1res = "Fifteen"
      end
      if (@p1points == 2)
        p1res = "Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@p1points >= 4 and @p2points >= 0 and (@p1points - @p2points) >= 2)
      result = "Win for " + @player1Name
    end
    if (@p2points >= 4 and @p1points >= 0 and (@p2points - @p1points) >= 2)
      result = "Win for " + @player2Name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
      p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1points += 1
  end

  def p2Score
    @p2points += 1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
      @p1 += 1
    else
      @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1 - @p2) * (@p1 - @p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
