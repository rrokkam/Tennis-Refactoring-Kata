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
		game.score1 += 1
	} else {
		game.score2 += 1
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

func (game *tennisGame1) GetScore() string {
	score := ""
	tempScore := 0
	if game.score1 == game.score2 {
		score = getScoreForEvenGame(game.score1)
	} else if game.score1 >= 4 || game.score2 >= 4 {
		minusResult := game.score1 - game.score2
		if minusResult == 1 {
			score = "Advantage player1"
		} else if minusResult == -1 {
			score = "Advantage player2"
		} else if minusResult >= 2 {
			score = "Win for player1"
		} else {
			score = "Win for player2"
		}
	} else {
		for i := 1; i < 3; i++ {
			if i == 1 {
				tempScore = game.score1
			} else {
				score += "-"
				tempScore = game.score2
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
	}
	return score
}
