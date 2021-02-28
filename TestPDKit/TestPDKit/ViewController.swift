//
//  ViewController.swift
//  TestPDKit
//
//  Created by deng on 2021/2/22.
//

import UIKit
import PDKit

class ViewController: UIViewController {
    
    let colorView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.make {
            view.addSubview($0)
            $0.backgroundColor = Color.green
            $0.layer.cornerRadius = 50
        }.al.make {
            $0.centerX(view.al.centerX)
            $0.centerY(view.al.centerY)
            $0.size(100)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        colorView.al.make {
            $0.updateCenterX(100)
        }
    }
}
