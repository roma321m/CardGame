
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
    var iterations = 5
    var scoreLeft:Int = 0
    var scoreRight:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = myTimer(delegate: self, numberOfIterations: iterations)
    }
    
    @IBAction func StartClikced(_ sender: Any) {
        main_BTN_start.isHidden = true
        timer?.startTimer()
    }
    
}

extension ViewController: CallBack_Timer {
    
    func tickDetected(iter: Int) {
        print("iter: \(iter)")// for debugging
        
        if(iter == iterations){
            // end game here - show res and get ready for next one
        }else{
            // roll cards and update the scores
        }
    }
    
}

