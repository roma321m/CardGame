import Foundation

protocol CallBack_Timer {
    func tickDetected(iter: Int)
}

protocol cards {
    func randomNumbers()
    func checkNumbers()
    func updateCards()
    func resetCards()
}

protocol score {
    func updateScore()
    func resetScore()
    func getWinner() -> String
}

protocol board {
    func updateBoard(iter: Int)
    func setWinner()
    func resetBoard()
}
