package tenniskata

type tennisGame1 struct {
	score1      int
	score2      int
	player1Name string
	player2Name string
}

// TennisGame1 constructs a TennisGame for kata 1
func TennisGame1(player1Name string, player2Name string) TennisGame {
	return &tennisGame1{
		player1Name: player1Name,
		player2Name: player2Name}
}

func (game *tennisGame1) WonPoint(playerName string) {
	if playerName == game.player1Name {
		game.score1++
	} else if playerName == game.player2Name {
		game.score2++
	}
}

func (game *tennisGame1) GetScore() string {
	if game.score1 == game.score2 {
		return game.getScoreForEvenGame()
	} else if game.score1 >= 4 || game.score2 >= 4 {
		return game.getScoreForAdvantageOrWonGame()
	} else {
		return game.getScoreForRegularGame()
	}
}

func (game *tennisGame1) getScoreForEvenGame() string {
	if game.score1 < 3 {
		return game.wordFromScore(game.score1) + "-" + "All"
	}
	return "Deuce"
}

func (game *tennisGame1) getScoreForAdvantageOrWonGame() string {
	diff := game.score1 - game.score2
	if diff == 1 || diff == -1 {
		return "Advantage " + game.getLeader(diff)
	}
	return "Win for " + game.getLeader(diff)
}

func (game *tennisGame1) getLeader(diff int) string {
	if diff > 0 {
		return game.player1Name
	} else if diff < 0 {
		return game.player2Name
	} else {
		return ""
	}
}

func (game *tennisGame1) getScoreForRegularGame() string {
	return game.wordFromScore(game.score1) + "-" + game.wordFromScore(game.score2)
}

func (game *tennisGame1) wordFromScore(score int) string {
	return [4]string{"Love", "Fifteen", "Thirty", "Forty"}[score]
}
