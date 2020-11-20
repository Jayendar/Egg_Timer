
import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?  
    
    @IBOutlet weak var titleLabel: UILabel! //used to incorperate title with the code
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var somethingProgress: UIView! // incorporates the progress bar
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard": 7
    ]
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle! // removes opeional keyword
        totalTime = eggTimes[hardness]! // removes the optional as the type is usually int?
        
        // TO RESET THE PROGRESS BAR UPON CLICKING OTHER EGGS
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
         
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print( Float(secondsPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!" // changes the title to done once done
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource:"alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
                
    }

    
    
}
