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
        
        colorView.makeStyles {
            view.addSubview($0)
            $0.backgroundColor = .gray
        }.al.make {
            $0.size(100)
            $0.centerToSuperview()
        }
    }
}

