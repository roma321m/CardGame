
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var main_BTN_start: UIButton!
    @IBOutlet weak var main_LBL_score_right: UILabel!
    @IBOutlet weak var main_LBL_score_left: UILabel!
    @IBOutlet weak var main_IMG_card_left: UIImageView!
    @IBOutlet weak var main_IMG_card_right: UIImageView!
    @IBOutlet weak var main_LBL_round_number: UILabel!
    @IBOutlet weak var main_LBL_title: UILabel!
    
    var timer:myTimer?
    let iterations = 10
    var scoreLeft:Int = 0
    var scoreRight:Int = 0
    let IMAGES = [#imageLiteral(resourceName: "ace-of-spades copy"), #imageLiteral(resourceName: "two-of-spades copy"), #imageLiteral(resourceName: "three-of-spades copy"), #imageLiteral(resourceName: "four-of-spades copy"), #imageLiteral(resourceName: "ace-of-spades copy"), #imageLiteral(resourceName: "six-of-spades copy"), #imageLiteral(resourceName: "seven-of-spades copy"), #imageLiteral(resourceName: "eight-of-spades copy"), #imageLiteral(resourceName: "nine-of-spades copy"), #imageLiteral(resourceName: "ten-of-spades copy"), #imageLiteral(resourceName: "jokers")]
    let SCORES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var rands: [Int] = Array(0 ..< 2)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = myTimer(delegate: self, numberOfIterations: iterations, timeInterval: 1.5)
        resetScore()
        resetCards()
        resetBoard()
    }
    
    @IBAction func StartClikced(_ sender: Any) {
        main_BTN_start.isHidden = true
        resetScore()
        resetCards()
        resetBoard()
        timer?.startTimer()
    }
    
}

extension ViewController: CallBack_Timer {
    
    func tickDetected(iter: Int) {
        randomNumbers()
        checkNumbers()
        updateCards()
        updateScore()
        updateBoard(iter: iter)
        
        if (iter == iterations){
            setWinner()
            main_BTN_start.isHidden = false
        }
    }
}

extension ViewController: cards {
    
    func randomNumbers() {
        for i in 0 ..< rands.count {
            var rand = Int.random(in: 0 ..< SCORES.count)
            while (rands[i] == rand){
                rand = Int.random(in: 0 ..< SCORES.count)
            }
            rands[i] = rand
        }
    }
    
    func checkNumbers() {
        while(rands[0] == rands[1]){
            randomNumbers()
        }
    }
    
    func updateCards() {
        main_IMG_card_left.image = IMAGES[rands[0]]
        main_IMG_card_right.image = IMAGES[rands[1]]
    }
    
    func resetCards() {
        main_IMG_card_left.image = IMAGES[IMAGES.count - 1]
        main_IMG_card_right.image = IMAGES[IMAGES.count - 1]
    }
}

extension ViewController: score {
    
    func getWinner() -> String {
        if (scoreLeft > scoreRight) {
            return "You Won"
        }
        return "You Lost"
    }
    
    func updateScore() {
        if (rands[0] > rands[1]) {
            scoreLeft += SCORES[rands[0]] - SCORES[rands[1]]
        } else {
            scoreRight += SCORES[rands[1]] - SCORES[rands[0]]
        }
        main_LBL_score_left.text = "\(scoreLeft)"
        main_LBL_score_right.text = "\(scoreRight)"
    }
    
    func resetScore() {
        scoreLeft = 0
        scoreRight = 0
        main_LBL_score_left.text = "\(scoreLeft)"
        main_LBL_score_right.text = "\(scoreRight)"
    }
}

extension ViewController: board {
    
    func updateBoard(iter: Int) {
        if (iter < 10){
            main_LBL_round_number.text = "0\(iter)/\(iterations)"
        } else {
            main_LBL_round_number.text = "\(iter)/\(iterations)"
        }
    }
    
    func setWinner() {
        main_LBL_title.text = getWinner()
    }
    
    func resetBoard() {
        main_LBL_title.text = "Milhama"
        main_LBL_round_number.text = "00/\(iterations)"
    }
    
}

