//
//  ViewController.swift
//  AppEventCount
//
//  Created by Carlos Alberto Savi on 10/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var configureLabel: UILabel!
    @IBOutlet weak var willConnectLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didEnterBackgroudLabel: UILabel!
    
    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroudCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    func updateView() {
        // Contadores que estão no App Delegate
        launchLabel.text = "O app foi carregado \(appDelegate.launchCount) veze(s)"
        configureLabel.text = "A configuração de conexão rodou \(appDelegate.configurationForConnectingCount) vezes"
        // Contadores que estão aqui na View Controller
        willConnectLabel.text = "A conexao de cena ocorreu \(willConnectCount) vezes"
        didBecomeActiveLabel.text = "A cena foi ativada \(didBecomeActiveCount)"
        willResignActiveLabel.text = "A cena entrar em modo resign ocorreu \(willResignActiveCount) vezes"
        willEnterForegroundLabel.text = "A cena entrar em foreground ocorreu \(willEnterForegroundCount) vezes"
        didEnterBackgroudLabel.text = "A cena entrar em background ocorreu \(didEnterBackgroudCount) vezes"
    }


}

