//
//  ViewController.swift
//  skullibrista
//
//  Created by Luan Arruda on 19/02/24.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var street: UIImageView!
    @IBOutlet weak var player: UIImageView!
    @IBOutlet weak var viGameOver: UIView!
    @IBOutlet weak var lbTimePlayed: UILabel!
    @IBOutlet weak var lbInstructions: UILabel!
    
    var isMoving = false
    lazy var motionManager = CMMotionManager()
    var gameTimer: Timer!
    var startDate: Date!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viGameOver.isHidden = true
        
        street.frame.size.width = view.frame.size.width * 2
        street.frame.size.height = street.frame.size.width * 2
        street.center = view.center
        
        player.center = view.center
        player.animationImages = []
        for i in 0...7 {
            let image = UIImage(named: "player\(i)")!
            player.animationImages?.append(image)
        }
        player.animationDuration = 0.5
        player.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 6.0, repeats: false) { (time) in
            self.start()
        }
    }
    
    func start(){
        lbInstructions.isHidden = true
        viGameOver.isHidden = true
        isMoving = false
        startDate = Date()
        
        player.transform = CGAffineTransform(rotationAngle: 0)
        street.transform = CGAffineTransform(rotationAngle: 0)
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                if error == nil {
                    if let data = data {
                        print("X:\(data.gravity.x), Y:\(data.gravity.y), Z:\(data.gravity.z)")
                        let angle = atan2(data.gravity.x, data.gravity.y) - .pi
                        self.player.transform = CGAffineTransform(rotationAngle: angle)
                        if !self.isMoving {
                            self.checkGameOver()
                        }
                    }
                }
            }
        }
        gameTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            self.rotateWorld()
        }
    }
    
    func rotateWorld() {
        let randomAngle = Double(arc4random_uniform(120))/100 - 0.6
        isMoving = true
        UIView.animate(withDuration: 0.75, animations: {
            self.street.transform = CGAffineTransform(rotationAngle: randomAngle)
        }) {(sucess) in
            self.isMoving = false
        }
    }
    
    func checkGameOver() {
        let worldAngle = atan2(self.street.transform.a, self.street.transform.b)
        let playerAngle = atan2(self.player.transform.a, self.player.transform.b)
        let difference = abs(worldAngle - playerAngle)
        if difference > 0.25 {
            gameTimer.invalidate()
            viGameOver.isHidden = false
            motionManager.stopDeviceMotionUpdates()
            let secondsPlayed = round(Date().timeIntervalSince(startDate))
            lbTimePlayed.text = "Você jogou durante \(secondsPlayed) segundos."
        }
    }

    @IBAction func playAgain(_ sender: Any) {
        start()
    }
    
}

