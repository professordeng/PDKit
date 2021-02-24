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
            $0.backgroundColor = Color.black
            $0.layer.borderWidth = 5
            $0.layer.borderColor = Color.green.cgColor
        }.al.make {
            $0.size(100)
            $0.centerToSuperview()
        }
    }
}

extension Color {
    static var black = color(light: 000000, dark: 000000)
}
