//
//  MakeStyles.swift
//  PDKit
//
//  Created by deng on 2021/2/23.
//

import UIKit

public protocol MakeStyle {}
extension MakeStyle where Self: UIView {
    @discardableResult
    public func make(_ closure: (_: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension UIView: MakeStyle {}
