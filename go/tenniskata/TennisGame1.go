package tenniskata

type tennisGame1 struct {
	score1      int
	score2      int
	player1Name string
	player2Name string
}

func TennisGame1(player1Name string, player2Name string) TennisGame {
	game := &tennisGame1{
		player1Name: player1Name,
		player2Name: player2Name}

	return game
}

func (game *tennisGame1) WonPoint(playerName string) {
	if playerName == "player1" {
		game.score1++
	} else {
		game.score2++
	}
}

func getScoreForEvenGame(score1 int) string {
	score := ""
	switch score1 {
	case 0:
		score = "Love-All"
	case 1:
		score = "Fifteen-All"
	case 2:
		score = "Thirty-All"
	default:
		score = "Deuce"
	}
	return score
}

func getScoreForAdvantageGame(score1, score2 int) string {
	score := ""
	minusResult := score1 - score2
	if minusResult == 1 {
		score = "Advantage player1"
	} else if minusResult == -1 {
		score = "Advantage player2"
	} else if minusResult >= 2 {
		score = "Win for player1"
	} else {
		score = "Win for player2"
	}
	return score
}

func getScoreForRegularGame(score1, score2 int) string {
	score := ""
	tempScore := 0
	for i := 1; i < 3; i++ {
		if i == 1 {
			tempScore = score1
		} else {
			score += "-"
			tempScore = score2
		}
		switch tempScore {
		case 0:
			score += "Love"
		case 1:
			score += "Fifteen"
		case 2:
			score += "Thirty"
		case 3:
			score += "Forty"
		}
	}
	return score
}

func (game *tennisGame1) GetScore() string {
	if game.score1 == game.score2 {
		return getScoreForEvenGame(game.score1)
	} else if game.score1 >= 4 || game.score2 >= 4 {
		return getScoreForAdvantageGame(game.score1, game.score2)
	} else {
		return getScoreForRegularGame(game.score1, game.score2)
	}
}
