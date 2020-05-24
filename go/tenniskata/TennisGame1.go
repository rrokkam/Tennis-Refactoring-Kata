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
	switch score1 {
	case 0:
		return "Love-All"
	case 1:
		return "Fifteen-All"
	case 2:
		return "Thirty-All"
	default:
		return "Deuce"
	}
}

func getScoreForAdvantageGame(score1, score2 int) string {
	minusResult := score1 - score2
	if minusResult == 1 {
		return "Advantage player1"
	} else if minusResult == -1 {
		return "Advantage player2"
	} else if minusResult >= 2 {
		return "Win for player1"
	} else {
		return "Win for player2"
	}
}

func getScoreForRegularGame(score1, score2 int) string {
	return wordFromScore(score1) + "-" + wordFromScore(score2)
}

func wordFromScore(tempScore int) string {
	switch tempScore {
	case 0:
		return "Love"
	case 1:
		return "Fifteen"
	case 2:
		return "Thirty"
	case 3:
		return "Forty"
	default:
		return ""
	}
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
