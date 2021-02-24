//
//  MakeStyles.swift
//  PDKit
//
//  Created by deng on 2021/2/23.
//

import UIKit

public protocol MakeStyles {}
extension MakeStyles where Self: UIView {
    @discardableResult
    public func makeStyles(_ closure: (_: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension UIView: MakeStyles {}
