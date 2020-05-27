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

  def tied_label(points)
    label[points] + '-All'
  end

  def untied_label(server_points, receiver_points)
    label[server_points] + '-' + label[receiver_points]
  end

  def advantage_label(name)
    'Advantage ' + name
  end

  def win_label(name)
    'Win for ' + name
  end

  def deuce_label
    'Deuce'
  end

  def score
    return tied_label(@server.points)                     if (@server.points < 3)    && tied?
    return deuce_label                                    if (@server.points >= 3)   && tied?
    return untied_label(@server.points, @receiver.points) if [@server.points, @receiver.points].max < 4
    return win_label(@server.name)                        if (@server.points >= 4)   && server_lead > 1
    return win_label(@receiver.name)                      if (@receiver.points >= 4) && receiver_lead > 1
    return advantage_label(@server.name)                  if (@server.points >= 4)   && server_lead == 1
    return advantage_label(@receiver.name)                if (@receiver.points >= 4) && receiver_lead == 1

    ''
  end

  def tied?
    @server.points == @receiver.points
  end

  def server_lead
    @server.points - @receiver.points
  end

  def receiver_lead
    @receiver.points - @server.points
  end
end
