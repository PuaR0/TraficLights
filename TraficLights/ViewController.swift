//
//  ViewController.swift
//  TraficLights
//
//  Created by Алиага С on 15.6.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private let lightsOff: CGFloat = 0.5
    private let lightsOn: CGFloat = 1
    private var currentLight = CurrentLight.red

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        startButton.setTitle("START", for: .normal)
        
        redLightView.backgroundColor = .red
        yellowLightView.backgroundColor = .yellow
        greenLightView.backgroundColor = .green
        
        redLightView.alpha = lightsOff
        yellowLightView.alpha = lightsOff
        greenLightView.alpha = lightsOff
 
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLightView.alpha = lightsOff
            redLightView.alpha = lightsOn
            currentLight = .yellow
        case .yellow:
            redLightView.alpha = lightsOff
            yellowLightView.alpha = lightsOn
            currentLight = .green
        case .green:
            yellowLightView.alpha = lightsOff
            greenLightView.alpha = lightsOn
            currentLight = .red
        }
    }
}

