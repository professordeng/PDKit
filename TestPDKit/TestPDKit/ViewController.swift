//
//  ViewController.swift
//  TestPDKit
//
//  Created by deng on 2021/2/22.
//

import UIKit
import PDKit

class ViewController: UIViewController {
    
    let startView: UIView = .init()
    let endView  : UIView = .init()
    
    var displayLink: DisplayLink?
    var status: Status = .init()
    let xOffset: CGFloat = 0
    let yOffset: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startView.make {
            view.addSubview($0)
            $0.backgroundColor = Color.green
            $0.layer.cornerRadius = 50
        }.al.make {
            $0.size(100)
            $0.centerToSuperview()
        }
        
        endView.make {
            view.addSubview($0)
            $0.layer.borderWidth = 5
            $0.layer.borderColor = Color.red.cgColor
            $0.layer.cornerRadius = 50
        }.al.make {
            $0.size(100)
            $0.centerXToSuperview()
            $0.centerY(view.al.centerY, 100)
        }
        
    }
    
    func move(duration: Int, fps: Int) {
        let xStep = self.xOffset / CGFloat(duration * fps)
        let yStep = self.yOffset / CGFloat(duration * fps)
        
        var sum: Int = 0
        displayLink = .init(fps) {
            sum += 1
            if sum >= (duration*fps) { self.displayLink = nil }
            
            self.status.move(xStep: xStep, yStep: yStep)
            self.startView.al.make {
                $0.updateCenterX(self.status.xOffset)
                $0.updateCenterY(self.status.yOffset)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        move(duration: 1, fps: 60)
    }
}

extension ViewController {
    struct Status {
        var xOffset: CGFloat = 0
        var yOffset: CGFloat = 0
        
        mutating func move(xStep: CGFloat, yStep: CGFloat) {
            xOffset += xStep
            yOffset += yStep
        }
    }
}
