//
//  ViewController.swift
//  ViewpointClock
//
//  Created by kisoo Um on 2020/09/15.
//  Copyright © 2020 kisoo Um. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockView: UIView!
    @IBOutlet weak var counterClockView: UIView!
    @IBOutlet weak var oneDayClockView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            self.clockView.setNeedsDisplay()
            self.counterClockView.setNeedsDisplay()
            self.oneDayClockView.setNeedsDisplay()
            
        }
        
    }
    
    
    


}

