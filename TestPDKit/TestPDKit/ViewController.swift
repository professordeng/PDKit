//
//  ViewController.swift
//  TestPDKit
//
//  Created by deng on 2021/2/22.
//

import UIKit
import PDKit

class ViewController: UIViewController {
    
    var status      : Status = .init(time: 0)
    let colorView   : UIView = .init()
    var displayLink : DisplayLink?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.make {
            view.addSubview($0)
            $0.backgroundColor = Color.green
            $0.layer.cornerRadius = 10
        }.al.make {
            $0.size(20)
            $0.centerX(view.al.centerX, status.xOffset)
            $0.centerY(view.al.centerY, status.yOffset)
        }
    }
    
    func animate() {
        status = status.update(interval: 0.01)
        colorView.al.make {
            $0.updateCenterX(status.xOffset)
            $0.updateCenterY(status.yOffset)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayLink = (displayLink != nil) ? nil : .init(60) {
            self.animate()
        }
    }
}

extension ViewController {
    struct Status {
        let radius : CGFloat = 40
        var time   : CGFloat
        var xOffset: CGFloat
        var yOffset: CGFloat
        
        init(time: CGFloat) {
            self.time = time
            xOffset = radius * (2*cos(time) - cos(2*time))
            yOffset = radius * (2*sin(time) - sin(2*time))
        }
        
        func update(interval: CGFloat) -> Self {
            return .init(time: time + interval)
        }
    }
}
