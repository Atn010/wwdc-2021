//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import AVKit

// Styling
let backgroundColor = UIColor.white
let textColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
let buttonTextColor = UIColor.black
let buttonBackgroundColor = UIColor(red: 1.00, green: 0.81, blue: 0.59, alpha: 1.00)
let buttonShadowColor = UIColor(red: 0.86, green: 0.71, blue: 0.53, alpha: 1.00).cgColor

var sfxPlayer: AVAudioPlayer?

func playClickSound() {
    guard let url = Bundle.main.url(forResource: "brnck-button_click", withExtension: "mp3") else { return }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        sfxPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        guard let player = sfxPlayer else { return }
        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
}

// Main Menu
class MainMenuViewController: UIViewController {
    let titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 540, height: 40))
    let imageView = UIImageView(frame: CGRect(x: 0, y: 320, width: 600, height: 600))
    let sitStandButton = UIButton(frame: CGRect(x: 220, y: 120, width: 160, height: 50))
    let handStretchButton = UIButton(frame: CGRect(x: 220, y: 220, width: 160, height: 50))
    let turnStretchButton = UIButton(frame: CGRect(x: 220, y: 320, width: 160, height: 50))
    let creditsButton = UIButton(frame: CGRect(x: 450, y: 500, width: 100, height: 50))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        titleLabel.text = "Which one you want to start with?"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        titleLabel.textColor = textColor
        
        
        sitStandButton.setTitle("Sit and Stand", for: .normal)
        sitStandButton.backgroundColor = buttonBackgroundColor
        sitStandButton.setTitleColor(buttonTextColor, for: .normal)
        sitStandButton.layer.cornerRadius = 8
        sitStandButton.layer.shadowColor = buttonShadowColor
        sitStandButton.layer.shadowOpacity = 0.5
        sitStandButton.layer.shadowOffset = .init(width: 0, height: 5)
        sitStandButton.layer.shadowRadius = 2.5
        sitStandButton.addTarget(self, action: #selector(openSitStandExercise), for: .touchUpInside)
        
        
        handStretchButton.setTitle("Stretch Hands", for: .normal)
        handStretchButton.backgroundColor = buttonBackgroundColor
        handStretchButton.setTitleColor(buttonTextColor, for: .normal)
        handStretchButton.layer.cornerRadius = 8
        handStretchButton.layer.shadowColor = buttonShadowColor
        handStretchButton.layer.shadowOpacity = 0.5
        handStretchButton.layer.shadowOffset = .init(width: 0, height: 5)
        handStretchButton.layer.shadowRadius = 2.5
        handStretchButton.addTarget(self, action: #selector(openStretchWristExercise), for: .touchUpInside)
        
        
        turnStretchButton.setTitle("Turn Stretch", for: .normal)
        turnStretchButton.backgroundColor = buttonBackgroundColor
        turnStretchButton.setTitleColor(buttonTextColor, for: .normal)
        turnStretchButton.layer.cornerRadius = 8
        turnStretchButton.layer.shadowColor = buttonShadowColor
        turnStretchButton.layer.shadowOpacity = 0.5
        turnStretchButton.layer.shadowOffset = .init(width: 0, height: 5)
        turnStretchButton.layer.shadowRadius = 2.5
        turnStretchButton.addTarget(self, action: #selector(openTurnStretchExercise), for: .touchUpInside)
        
        creditsButton.setTitle("Credits", for: .normal)
        creditsButton.backgroundColor = buttonBackgroundColor
        creditsButton.setTitleColor(buttonTextColor, for: .normal)
        creditsButton.layer.cornerRadius = 8
        creditsButton.layer.shadowColor = buttonShadowColor
        creditsButton.layer.shadowOpacity = 0.5
        creditsButton.layer.shadowOffset = .init(width: 0, height: 5)
        creditsButton.layer.shadowRadius = 2.5
        creditsButton.addTarget(self, action: #selector(openCredits), for: .touchUpInside)
        
        imageView.image = UIImage(named: "sitting.png")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(sitStandButton)
        self.view.addSubview(handStretchButton)
        self.view.addSubview(turnStretchButton)
        self.view.addSubview(creditsButton)
    }
    
    @objc func openSitStandExercise() {
        playClickSound()
        self.navigationController?.pushViewController(SitStandViewController(), animated: true)
    }
    
    @objc func openStretchWristExercise() {
        playClickSound()
        self.navigationController?.pushViewController(StrechWristViewController(), animated: true)
    }
    
    @objc func openTurnStretchExercise() {
        playClickSound()
        self.navigationController?.pushViewController(TurnStretchViewController(), animated: true)
    }
    
    @objc func openCredits() {
        playClickSound()
        self.navigationController?.pushViewController(CreditViewController(), animated: true)
    }
}

// Credits
class CreditViewController: UIViewController {
    let titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 540, height: 40))
    let bodyLabel = UILabel(frame: CGRect(x: 30, y: 30, width: 540, height: 400))
    let imageView = UIImageView(frame: CGRect(x: 0, y: 320, width: 600, height: 600))
    let menuButton = UIButton.init(frame: CGRect(x: 450, y: 500, width: 100, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        titleLabel.text = "Credits"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 24, weight: .black)
        titleLabel.textColor = textColor
        
        let creditsText = NSMutableAttributedString()
        creditsText.append(NSAttributedString(
            string: "Developed By\nAntonius George Sunggeriwan\natn010.com\n\nAudio By\nLovely - Eric Godlow Beats\nsoundcloud.com/eric-godlow/lovely\nButton Click - brnck\nfreesound.org/people/brnck/sounds/257357/\n\nReference\nReal Time Desk Exercises & Stretches - Ask Doctor Jo\nyoutu.be/CAq9vV7gkrs",
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .light),
                NSAttributedString.Key.foregroundColor: textColor
        ]))
        
        let developedByRange = (creditsText.string as NSString).range(of: "Developed By")
        creditsText.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 24, weight: .semibold),
            range: developedByRange
        )
        
        let audioByRange = (creditsText.string as NSString).range(of: "Audio By")
        creditsText.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 24, weight: .semibold),
            range: audioByRange
        )
        
        let referenceRange = (creditsText.string as NSString).range(of: "Reference")
        creditsText.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 24, weight: .semibold),
            range: referenceRange
        )
        
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .center
        bodyLabel.attributedText = creditsText
        
        menuButton.setTitle("MENU", for: .normal)
        menuButton.backgroundColor = buttonBackgroundColor
        menuButton.setTitleColor(buttonTextColor, for: .normal)
        menuButton.layer.cornerRadius = 8
        menuButton.layer.shadowColor = buttonShadowColor
        menuButton.layer.shadowOpacity = 0.5
        menuButton.layer.shadowOffset = .init(width: 0, height: 5)
        menuButton.layer.shadowRadius = 2.5
        menuButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
        
        imageView.image = UIImage(named: "sitting.png")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(bodyLabel)
        self.view.addSubview(menuButton)
    }
    
    @objc func backToMenu() {
        playClickSound()
        self.navigationController?.popViewController(animated: true)
    }
}

// Intro
class IntroViewController : UIViewController {
    let titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 540, height: 100))
    let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 600, height: 600))
    let nextButton = UIButton.init(frame: CGRect(x: 360, y: 160, width: 120, height: 50))
    
    var bgmPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = backgroundColor
        titleLabel.numberOfLines = 0
        titleLabel.text = "Hi, my name is Anton, I'm an App developer, and I'm here to share my tips on some light stretching from your desk."
        titleLabel.font = .systemFont(ofSize: 24, weight: .regular)
        titleLabel.textColor = textColor
        
        
        imageView.image = UIImage(named: "sitting-alt2.png")
        
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.backgroundColor = buttonBackgroundColor
        nextButton.setTitleColor(buttonTextColor, for: .normal)
        nextButton.layer.cornerRadius = 8
        nextButton.layer.shadowColor = buttonShadowColor
        nextButton.layer.shadowOpacity = 0.5
        nextButton.layer.shadowOffset = .init(width: 0, height: 5)
        nextButton.layer.shadowRadius = 2.5
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(nextButton)
        
        playBGM()
    }
    
    func playBGM() {
            guard let url = Bundle.main.url(forResource: "eric_godlow_beats-lovely(looped)", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                bgmPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                guard let player = bgmPlayer else { return }
                player.numberOfLoops = -1
                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        
    }
    
    @objc func nextPage() {
        playClickSound()
        self.navigationController?.pushViewController(DisclaimerViewController(), animated: true)
    }
}


class DisclaimerViewController: UIViewController {
    let titleLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 540, height: 40))
    let bodyLabel = UILabel(frame: CGRect(x: 30, y: 30, width: 540, height: 300))
    let imageView = UIImageView(frame: CGRect(x: 0, y: 320, width: 600, height: 600))
    let agreeButton = UIButton.init(frame: CGRect(x: 260, y: 320, width: 80, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        
        titleLabel.text = "Disclaimer"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 24, weight: .black)
        titleLabel.textColor = textColor
        
        bodyLabel.text = "This is not medical advice or a treatment plan and is intended for general education and demonstration pirpose only and shouldn’t be used to self-diagnose or self-treat of any health, medical or physical condition. You agree to indemnify and hold harmless on me and my creator for any and all losses, injuries, or damages from any and all claims that arise from your use or misuse of these tips."
        bodyLabel.textAlignment = .justified
        bodyLabel.font = .systemFont(ofSize: 22, weight: .regular)
        bodyLabel.textColor = textColor
        bodyLabel.numberOfLines = 0
        
        
        imageView.image = UIImage(named: "sitting.png")
        
        agreeButton.setTitle("I Agree", for: .normal)
        agreeButton.backgroundColor = buttonBackgroundColor
        agreeButton.setTitleColor(buttonTextColor, for: .normal)
        agreeButton.layer.cornerRadius = 8
        agreeButton.layer.shadowColor = buttonShadowColor
        agreeButton.layer.shadowOpacity = 0.5
        agreeButton.layer.shadowOffset = .init(width: 0, height: 5)
        agreeButton.layer.shadowRadius = 2.5
        agreeButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(bodyLabel)
        self.view.addSubview(agreeButton)
    }
    
    
    @objc func nextPage() {
        playClickSound()
        self.navigationController?.pushViewController(MainMenuViewController(), animated: true)
    }
}


// Exercises
class SitStandViewController: UIViewController {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    let titleBackground = UIImageView(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
    let titleLabel = UILabel(frame: CGRect(x: 25, y: 20, width: 190, height: 50))
    let timerLabel = UILabel(frame: CGRect(x: 480, y: 20, width: 100, height: 50))
    let exerciseDescription = UILabel(frame: CGRect(x: 30, y: 510, width: 540, height: 60))
    let menuButton = UIButton.init(frame: CGRect(x: 460, y: 410, width: 120, height: 50))
    
    let sittingImage = UIImage(named: "sitting.png")
    let standingImage = UIImage(named: "standing.png")
    
    var imageSwitchCount = 0
    var time: Int = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        
        imageView.image = sittingImage
        
        titleBackground.image = UIImage(named: "title_background")
        titleBackground.contentMode = .scaleAspectFill
        titleLabel.text = "Sit and Stand"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        timerLabel.text = "00:00"
        timerLabel.font = .systemFont(ofSize: 24, weight: .regular)
        timerLabel.textColor = textColor
        
        exerciseDescription.text = "From sitting on the chair, stand up at a comfortable pace. Then sit down slowly. Repeat this five times."
        exerciseDescription.numberOfLines = 0
        exerciseDescription.font = .systemFont(ofSize: 24, weight: .regular)
        exerciseDescription.textColor = textColor
        
        menuButton.setTitle("MENU", for: .normal)
        menuButton.backgroundColor = buttonBackgroundColor
        menuButton.setTitleColor(buttonTextColor, for: .normal)
        menuButton.layer.cornerRadius = 8
        menuButton.layer.shadowColor = buttonShadowColor
        menuButton.layer.shadowOpacity = 0.5
        menuButton.layer.shadowOffset = .init(width: 0, height: 5)
        menuButton.layer.shadowRadius = 2.5
        menuButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleBackground)
        self.view.addSubview(titleLabel)
        self.view.addSubview(timerLabel)
        self.view.addSubview(exerciseDescription)
        self.view.addSubview(menuButton)
        
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }
    
    @objc func countTime() {
        DispatchQueue.main.async {
           self.time += 1
            let minutes = Int(Float((self.time / 60)).rounded(.down))
            let secconds = self.time - (minutes * 60)
            
            self.timerLabel.text = "\(String(format: "%02d", minutes)):\(String(format: "%02d", secconds))"
            
            
            if self.time % 3 == 0 {
                if self.imageSwitchCount == 0{
                    self.imageSwitchCount = 1
                    self.imageView.image = self.standingImage
                } else {
                    self.imageSwitchCount = 0
                    self.imageView.image = self.sittingImage
                }
            }
        }
    }
    
    @objc func backToMenu() {
        playClickSound()
        self.navigationController?.popViewController(animated: true)
    }
}

class StrechWristViewController: UIViewController {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    let titleBackground = UIImageView(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
    let titleLabel = UILabel(frame: CGRect(x: 25, y: 20, width: 190, height: 50))
    let timerLabel = UILabel(frame: CGRect(x: 480, y: 20, width: 100, height: 50))
    let exerciseDescription = UILabel(frame: CGRect(x: 30, y: 470, width: 540, height: 120))
    let menuButton = UIButton.init(frame: CGRect(x: 460, y: 410, width: 120, height: 50))
    
    let wristDownImage = UIImage(named: "stretch_wrist_down.png")
    let wristUpImage = UIImage(named: "stretch_wrist_up.png")
    
    var imageSwitchCount = 0
    var time: Int = 0
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        
        imageView.image = wristDownImage
        
        titleBackground.image = UIImage(named: "title_background")
        titleBackground.contentMode = .scaleAspectFill
        titleLabel.text = "Stretch Down"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        timerLabel.text = "00:00"
        timerLabel.font = .systemFont(ofSize: 24, weight: .regular)
        titleLabel.textColor = textColor
        
        exerciseDescription.text = "Straighten your arm to your front and stretch down your hand like in the picture, and hold it for 5 seconds. then stretch up your hand like in the picture. Repeat three times."
        exerciseDescription.numberOfLines = 0
        exerciseDescription.font = .systemFont(ofSize: 24, weight: .regular)
        exerciseDescription.textColor = textColor
        
        menuButton.setTitle("MENU", for: .normal)
        menuButton.backgroundColor = buttonBackgroundColor
        menuButton.setTitleColor(buttonTextColor, for: .normal)
        menuButton.layer.cornerRadius = 8
        menuButton.layer.shadowColor = buttonShadowColor
        menuButton.layer.shadowOpacity = 0.5
        menuButton.layer.shadowOffset = .init(width: 0, height: 5)
        menuButton.layer.shadowRadius = 2.5
        menuButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleBackground)
        self.view.addSubview(titleLabel)
        self.view.addSubview(timerLabel)
        self.view.addSubview(exerciseDescription)
        self.view.addSubview(menuButton)
        
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }
    
    @objc func countTime() {
        DispatchQueue.main.async {
           self.time += 1
            let minutes = Int(Float((self.time / 60)).rounded(.down))
            let secconds = self.time - (minutes * 60)
            
            self.timerLabel.text = "\(String(format: "%02d", minutes)):\(String(format: "%02d", secconds))"
            
            
            if self.time % 5 == 0 {
                if self.imageSwitchCount == 0{
                    self.imageSwitchCount = 1
                    self.imageView.image = self.wristUpImage
                    self.titleLabel.text = "Stretch Up"
                } else {
                    self.imageSwitchCount = 0
                    self.imageView.image = self.wristDownImage
                    self.titleLabel.text = "Stretch Down"
                }
            }
        }
    }
    
    @objc func backToMenu() {
        playClickSound()
        self.navigationController?.popViewController(animated: true)
    }
}

class TurnStretchViewController: UIViewController {
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
    let titleBackground = UIImageView(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
    let titleLabel = UILabel(frame: CGRect(x: 25, y: 20, width: 190, height: 50))
    let timerLabel = UILabel(frame: CGRect(x: 480, y: 20, width: 100, height: 50))
    let exerciseDescription = UILabel(frame: CGRect(x: 30, y: 470, width: 540, height: 120))
    let menuButton = UIButton.init(frame: CGRect(x: 460, y: 410, width: 120, height: 50))
    
    let turnLeft = UIImage(named: "turn_left.png")
    let turnRight = UIImage(named: "turn_right.png")
    
    var imageSwitchCount = 0
    var time: Int = 0
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = backgroundColor
        
        imageView.image = turnLeft
        
        titleBackground.image = UIImage(named: "title_background")
        titleBackground.contentMode = .scaleAspectFill
        titleLabel.text = "Turn Stretch"
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        timerLabel.text = "00:00"
        timerLabel.font = .systemFont(ofSize: 24, weight: .regular)
        titleLabel.textColor = textColor
        
        exerciseDescription.text = "Sit straight up, Turn your upper body to the right, holding to your seat back support or handles, and hold for 5 seconds before changing to the left. Do it at least 3 times for each side."
        exerciseDescription.numberOfLines = 0
        exerciseDescription.font = .systemFont(ofSize: 24, weight: .regular)
        exerciseDescription.textColor = textColor
        
        menuButton.setTitle("MENU", for: .normal)
        menuButton.backgroundColor = buttonBackgroundColor
        menuButton.setTitleColor(buttonTextColor, for: .normal)
        menuButton.layer.cornerRadius = 8
        menuButton.layer.shadowColor = buttonShadowColor
        menuButton.layer.shadowOpacity = 0.5
        menuButton.layer.shadowOffset = .init(width: 0, height: 5)
        menuButton.layer.shadowRadius = 2.5
        menuButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(imageView)
        self.view.addSubview(titleBackground)
        self.view.addSubview(titleLabel)
        self.view.addSubview(timerLabel)
        self.view.addSubview(exerciseDescription)
        self.view.addSubview(menuButton)
        
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer?.invalidate()
    }
    
    @objc func countTime() {
        DispatchQueue.main.async {
           self.time += 1
            let minutes = Int(Float((self.time / 60)).rounded(.down))
            let secconds = self.time - (minutes * 60)
            
            self.timerLabel.text = "\(String(format: "%02d", minutes)):\(String(format: "%02d", secconds))"
            
            
            if self.time % 5 == 0 {
                if self.imageSwitchCount == 0{
                    self.imageSwitchCount = 1
                    self.imageView.image = self.turnRight
                } else {
                    self.imageSwitchCount = 0
                    self.imageView.image = self.turnLeft
                }
            }
        }
    }
    
    @objc func backToMenu() {
        playClickSound()
        self.navigationController?.popViewController(animated: true)
    }
}


// Present the view controller in the Live View window
let navigation = UINavigationController(rootViewController: IntroViewController())
navigation.setNavigationBarHidden(true, animated: false)
navigation.preferredContentSize = CGSize(width: 600, height: 600)
let window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
window.rootViewController = navigation
PlaygroundPage.current.liveView = navigation.view
PlaygroundPage.current.needsIndefiniteExecution = true
