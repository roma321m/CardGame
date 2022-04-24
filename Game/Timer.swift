import Foundation

class myTimer {
    
    var timer: Timer?
    var runCount = 0
    var numberOfIterations = 0
    var timeInterval = 0.0
    var repeats = true
    var delegate: CallBack_Timer?
    
    init(delegate: CallBack_Timer, numberOfIterations: Int, timeInterval: Double, repeats: Bool){
        self.delegate = delegate
        self.numberOfIterations = numberOfIterations
        self.timeInterval = timeInterval
        self.repeats = repeats
    }
    
    convenience init(delegate: CallBack_Timer, numberOfIterations: Int, timeInterval: Double){
        self.init(delegate: delegate, numberOfIterations: numberOfIterations, timeInterval: timeInterval, repeats: true)
    }
    
    convenience init(delegate: CallBack_Timer, numberOfIterations: Int) {
        self.init(delegate: delegate, numberOfIterations: numberOfIterations, timeInterval: 1.0)
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: repeats)
    }
    
    @objc private func fireTimer() {
        if runCount == numberOfIterations {
            timer?.invalidate()
            runCount = 0;
        }else{
            runCount += 1
            delegate?.tickDetected(iter: runCount)
        }
    }
}
