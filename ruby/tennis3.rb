# frozen_string_literal: true

class TennisGame3
  def initialize(player1_name, player2_name)
    @p1_name = player1_name
    @p2_name = player2_name
    @p1_score = 0
    @p2_score = 0
  end

  def won_point(name)
    if name == @p1_name
      @p1_score += 1
    else
      @p2_score += 1
    end
  end

  def score
    if ((@p1_score < 4) && (@p2_score < 4)) && (@p1_score + @p2_score < 6)
      s = label[@p1_score]
      @p1_score == @p2_score ? s + '-All' : s + '-' + p[@p2_score]
    elsif @p1_score == @p2_score
      'Deuce'
    else
      advantage? ? advantage_label : win_label
    end
  end

  def label
    %w[Love Fifteen Thirty Forty]
  end

  def leader_name
    @p1_score > @p2_score ? @p1_name : @p2_name
  end

  def advantage?
    (@p1_score - @p2_score).abs == 1
  end

  def advantage_label
    'Advantage ' + leader_name
  end

  def win_label
    'Win for ' + leader_name
  end
end
