//
//  SecondViewController.swift
//  Racing
//
//  Created by Евгений  Гравдин  on 11/04/2021.
//

import UIKit

class GameViewController: UIViewController {
    private var heightMobil: CGFloat!
    private var score = 0
    var timer: Timer?
    var avatar: String?
    var record = ""
    var recordArray = [String]()
  
    @IBOutlet weak var countScoreLabel: UILabel!

    @IBOutlet weak var imageRoadOne: UIImageView!
    @IBOutlet weak var imageRoadTwo: UIImageView!
    @IBOutlet weak var imageRoadTree: UIImageView!
    @IBOutlet weak var imageRoadFour: UIImageView!
    @IBOutlet weak var imageRoadFive: UIImageView!
    @IBOutlet weak var imageRoadSix: UIImageView!
    @IBOutlet weak var imageRoadSeven: UIImageView!
    @IBOutlet weak var imageViewEight: UIImageView!

    @IBOutlet weak var imageLeftEye: UIImageView!
    @IBOutlet weak var imageRightEye: UIImageView!

    @IBOutlet weak var zombiView: UIView!

    @IBOutlet weak var moveImage: UIView!
    @IBOutlet weak var avatarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    imageLeftEye.layer.cornerRadius = imageLeftEye.bounds.height / 2
    imageRightEye.layer.cornerRadius = imageRightEye.bounds.height / 2
    timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(moveRoad), userInfo: nil, repeats: true)
    timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(zombieMoved), userInfo: nil, repeats: true)
    
    heightMobil = self.view.frame.maxY

        self.avatar = UserDefaults.standard.string(forKey: "avatar")
        switch avatar {
        case "icSteampunk":
            avatarImage.image = UIImage(named: "icSteampunk")
        case "icMonster":
            avatarImage.image = UIImage(named: "icMonster")
        case "icRunner":
            avatarImage.image = UIImage(named: "icRunner")
        default:
            avatarImage.image = UIImage(named: "icRunner")
        }
      
      record = countScoreLabel.text ?? ""
}
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timerForScore) in
      self.score += 1
      self.countScoreLabel.text = "Score: \(self.score)"
    }
    
  }
@IBAction private func runnerPanGesture(_ sender: UIPanGestureRecognizer) {
    let move = sender.translation(in: self.moveImage)
    if let view = sender.view {
    view.center = CGPoint(x: view.center.x + move.x, y: view.center.y + move.y)
    if moveImage.frame.origin.x <= 70 {
        stopTimer()
        let storyboard = UIStoryboard(name: "GameViewController", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ReturnViewController")
        destinationViewController.modalPresentationStyle = .fullScreen
        present(destinationViewController, animated: true, completion: nil)
      saveRecord()
    }
    if moveImage.frame.origin.x >= 275 {
        stopTimer()
        let storyboard = UIStoryboard(name: "GameViewController", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ReturnViewController")
        destinationViewController.modalPresentationStyle = .fullScreen
        present(destinationViewController, animated: true, completion: nil)
      saveRecord()
    }
    if zombiView.frame.origin.x == moveImage.frame.origin.x {
        stopTimer()
        let storyboard = UIStoryboard(name: "GameViewController", bundle: Bundle.main)
        let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ReturnViewController")
        destinationViewController.modalPresentationStyle = .fullScreen
        present(destinationViewController, animated: true, completion: nil)
      saveRecord()
    }

    sender.setTranslation(CGPoint.zero, in: self.moveImage)
}
}

    @objc private func zombieMoved() {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat]) {
    self.zombiView.frame = CGRect(x: self.zombiView.frame.origin.x,
                                  y: self.zombiView.frame.origin.y + 0.5,
                                  width: self.zombiView.frame.size.width,
                                  height: self.zombiView.frame.size.height)
    if self.zombiView.frame.origin.y == self.heightMobil {
        self.zombiView.frame.origin.y = 10
    }
    if self.zombiView.frame.origin.y == 10 {
        self.zombiView.isHidden = false
    }
    if self.zombiView.frame.origin.y == 850 {
        self.zombiView.isHidden = true
    }
    }
    }

    func stopTimer() {
        timer?.invalidate()
    }
  
    func saveRecord() {
      UserDefaults.standard.set("Score: \(score)", forKey: "userRecord")
      fileManager()
    }

    func fileManager() {
        let data = Date()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(data).txt")
        let todos = String("Your score \(time)")
        do {
            try todos.write(to: path, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        var inString = ""
            do {
                inString = try String(contentsOf: path)
            } catch {
                print("Failed reading from URL: \(todos), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
    }

    @objc private func moveRoad() {
    UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat]) {
    self.imageRoadOne.frame = CGRect(x: self.imageRoadOne.frame.origin.x,
                                     y: self.imageRoadOne.frame.origin.y + 0.5,
                                     width: self.imageRoadOne.frame.size.width,
                                     height: self.imageRoadOne.frame.size.height)
    if self.imageRoadOne.frame.origin.y == self.heightMobil {
        self.imageRoadOne.frame.origin.y = 0
    }
    self.imageRoadTwo.frame = CGRect(x: self.imageRoadTwo.frame.origin.x,
                                     y: self.imageRoadTwo.frame.origin.y + 0.5,
                                     width: self.imageRoadTwo.frame.size.width,
                                     height: self.imageRoadTwo.frame.size.height)
    if self.imageRoadTwo.frame.origin.y == self.heightMobil {
        self.imageRoadTwo.frame.origin.y = 0
    }
    self.imageRoadTree.frame = CGRect(x: self.imageRoadTree.frame.origin.x,
                                      y: self.imageRoadTree.frame.origin.y + 0.5,
                                      width: self.imageRoadTree.frame.size.width,
                                      height: self.imageRoadTree.frame.size.height)
    if self.imageRoadTree.frame.origin.y == self.heightMobil {
        self.imageRoadTree.frame.origin.y = 0
    }
    self.imageRoadFour.frame = CGRect(x: self.imageRoadFour.frame.origin.x,
                                      y: self.imageRoadFour.frame.origin.y + 0.5,
                                      width: self.imageRoadFour.frame.size.width,
                                      height: self.imageRoadFour.frame.size.height)
    if self.imageRoadFour.frame.origin.y == self.heightMobil {
        self.imageRoadFour.frame.origin.y = 0
    }
    self.imageRoadFive.frame = CGRect(x: self.imageRoadFive.frame.origin.x,
                                      y: self.imageRoadFive.frame.origin.y + 0.5,
                                      width: self.imageRoadFive.frame.size.width,
                                      height: self.imageRoadFive.frame.size.height)
    if self.imageRoadFive.frame.origin.y == self.heightMobil {
        self.imageRoadFive.frame.origin.y = 0
    }
    self.imageRoadSix.frame = CGRect(x: self.imageRoadSix.frame.origin.x,
                                     y: self.imageRoadSix.frame.origin.y + 0.5,
                                     width: self.imageRoadSix.frame.size.width,
                                     height: self.imageRoadSix.frame.size.height)
    if self.imageRoadSix.frame.origin.y == self.heightMobil {
        self.imageRoadSix.frame.origin.y = 0
    }
    self.imageRoadSeven.frame = CGRect(x: self.imageRoadSeven.frame.origin.x,
                                       y: self.imageRoadSeven.frame.origin.y + 0.5,
                                       width: self.imageRoadSeven.frame.size.width,
                                       height: self.imageRoadSeven.frame.size.height)
    if self.imageRoadSeven.frame.origin.y == self.heightMobil {
        self.imageRoadSeven.frame.origin.y = 0
    }
    self.imageViewEight.frame = CGRect(x: self.imageViewEight.frame.origin.x,
                                       y: self.imageViewEight.frame.origin.y + 0.5,
                                       width: self.imageViewEight.frame.size.width,
                                       height: self.imageViewEight.frame.size.height)
    if self.imageViewEight.frame.origin.y == self.heightMobil {
        self.imageViewEight.frame.origin.y = 0
    }
    }
}
}
