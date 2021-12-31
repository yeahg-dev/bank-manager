import UIKit

class TimerLabel: UILabel {
    var timer: Timer!
    var count: Double = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func updateLabel() {
        count += 0.001
        self.text = formatSecondToTime()
    }
    
    func fire() {
        timer = .scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        
    }
    
    private func formatSecondToTime() -> String {
        let minute: Int = Int(self.count / 60)
        let second: Int = Int(self.count) % 60
        let milliSecond: Int = Int((self.count - floor(count)) * 1000)
        return "\(String(format: "%02d", minute)):\(String(format: "%02d", second)):\(String(format: "%03d", milliSecond))"
    }

}
