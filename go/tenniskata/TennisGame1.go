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
	if playerName == "player1" {
		game.score1++
	} else {
		game.score2++
	}
}

func (game *tennisGame1) GetScore() string {
	if game.score1 == game.score2 {
		return getScoreForEvenGame(game.score1)
	} else if game.score1 >= 4 || game.score2 >= 4 {
		return getScoreForAdvantageOrWonGame(game.score1, game.score2)
	} else {
		return getScoreForRegularGame(game.score1, game.score2)
	}
}

func getScoreForEvenGame(score int) string {
	if score < 3 {
		return wordFromScore(score) + "-" + "All"
	}
	return "Deuce"
}

func getScoreForAdvantageOrWonGame(score1, score2 int) string {
	diff := score1 - score2
	if diff == 1 || diff == -1 {
		return "Advantage" + " " + getLeader(diff)
	}
	return "Win for" + " " + getLeader(diff)
}

func getLeader(diff int) string {
	if diff > 0 {
		return "player1"
	}
	return "player2"

}

func getScoreForRegularGame(score1, score2 int) string {
	return wordFromScore(score1) + "-" + wordFromScore(score2)
}

func wordFromScore(score int) string {
	scores := [4]string{"Love", "Fifteen", "Thirty", "Forty"}
	return scores[score]
}
