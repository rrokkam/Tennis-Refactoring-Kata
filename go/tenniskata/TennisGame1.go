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
		return game.scoreForEvenGame()
	} else if game.score1 >= 4 || game.score2 >= 4 {
		return game.scoreForAdvantageOrWonGame()
	} else {
		return game.scoreForRegularGame()
	}
}

func (game *tennisGame1) scoreForEvenGame() string {
	if game.score1 < 3 {
		return game.wordFromScore(game.score1) + "-" + "All"
	}
	return "Deuce"
}

func (game *tennisGame1) scoreForAdvantageOrWonGame() string {
	if game.isAdvantage() {
		return "Advantage " + game.leader()
	}
	return "Win for " + game.leader()
}

func (game *tennisGame1) isAdvantage() bool {
	return (game.score1-game.score2 == 1) || (game.score2-game.score1 == 1)
}

func (game *tennisGame1) leader() string {
	if game.score1 > game.score2 {
		return game.player1Name
	} else if game.score1 < game.score2 {
		return game.player2Name
	} else {
		return ""
	}
}

func (game *tennisGame1) scoreForRegularGame() string {
	return game.wordFromScore(game.score1) + "-" + game.wordFromScore(game.score2)
}

func (game *tennisGame1) wordFromScore(score int) string {
	return [4]string{"Love", "Fifteen", "Thirty", "Forty"}[score]
}
