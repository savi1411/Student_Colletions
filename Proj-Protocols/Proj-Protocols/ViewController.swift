//
//  ViewController.swift
//  Proj-Protocols
//
//  Created by Carlos Alberto Savi on 10/03/21.
//

import UIKit

class ViewController: UIViewController, HeartRateReceiverDelegate {

    @IBOutlet weak var labelBPM: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let receiver = HeartRateReceiver()
        receiver.delegate = self
        receiver.startHeartRateMonitoringExample()
    }
    
    func heartRateUpdated(to bpm: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.labelBPM.text = "\(bpm)"
            print("The user has been shown a heart rate of \(bpm)")
        }
    }


}

