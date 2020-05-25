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
		return game.getScoreForEvenGame(game.score1)
	} else if game.score1 >= 4 || game.score2 >= 4 {
		return game.getScoreForAdvantageOrWonGame(game.score1, game.score2)
	} else {
		return game.getScoreForRegularGame(game.score1, game.score2)
	}
}

func (game *tennisGame1) getScoreForEvenGame(score int) string {
	if score < 3 {
		return game.wordFromScore(score) + "-" + "All"
	}
	return "Deuce"
}

func (game *tennisGame1) getScoreForAdvantageOrWonGame(score1, score2 int) string {
	diff := score1 - score2
	if diff == 1 || diff == -1 {
		return "Advantage" + " " + game.getLeader(diff)
	}
	return "Win for" + " " + game.getLeader(diff)
}

func (game *tennisGame1) getLeader(diff int) string {
	if diff > 0 {
		return "player1"
	}
	return "player2"

}

func (game *tennisGame1) getScoreForRegularGame(score1, score2 int) string {
	return game.wordFromScore(score1) + "-" + game.wordFromScore(score2)
}

func (game *tennisGame1) wordFromScore(score int) string {
	scores := [4]string{"Love", "Fifteen", "Thirty", "Forty"}
	return scores[score]
}
