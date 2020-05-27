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
    return regular_label if regular?
    return advantage_label if advantage?
    return win_label if win?

    deuce_label
  end

  def label
    %w[Love Fifteen Thirty Forty]
  end

  def leader_name
    @p1_score > @p2_score ? @p1_name : @p2_name
  end

  def regular?
    (@p1_score < 4) && (@p2_score < 4) && (@p1_score + @p2_score < 6)
  end

  def regular_label
    s = label[@p1_score]
    @p1_score == @p2_score ? s + '-All' : s + '-' + label[@p2_score]
  end

  def advantage?
    (@p1_score - @p2_score).abs == 1
  end

  def advantage_label
    'Advantage ' + leader_name
  end

  def win?
    (@p1_score - @p2_score).abs > 1
  end

  def win_label
    'Win for ' + leader_name
  end

  def deuce_label
    'Deuce'
  end
end
