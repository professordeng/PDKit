//
//  AutoLayout.swift
//  PDKit
//
//  Created by deng on 2021/2/23.
//

import UIKit

public struct LayoutProxy<T> {
    private let base: T
    init(_ base: T) { self.base = base }
}

public protocol LayoutNamespace {
    associatedtype WrappableType
    var al: WrappableType { get }
}

extension LayoutNamespace {
    public var al: LayoutProxy<Self> {
        LayoutProxy(self)
    }
}

extension UIView: LayoutNamespace {}
extension LayoutProxy where T: UIView {
    public var width: NSLayoutDimension { base.widthAnchor }
    public var height: NSLayoutDimension { base.heightAnchor }
    public var leading: NSLayoutXAxisAnchor { base.leadingAnchor }
    public var trailing: NSLayoutXAxisAnchor { base.trailingAnchor }
    public var top: NSLayoutYAxisAnchor { base.topAnchor }
    public var bottom: NSLayoutYAxisAnchor { base.bottomAnchor }
    public var centerY: NSLayoutYAxisAnchor { base.centerYAnchor }
    public var centerX: NSLayoutXAxisAnchor { base.centerXAnchor }
    
    public func height(_ height: CGFloat) {
        base.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    public func width(_ width: CGFloat) {
        base.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    public func size(_ size: CGFloat) {
        height(size)
        width(size)
    }
    
    public func leading(_ anchor: NSLayoutXAxisAnchor, _ offset: CGFloat = 0) {
        base.leadingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func leadingToSuperview(_ offset: CGFloat = 0) {
        if let view = base.superview {
            leading(view.leadingAnchor, offset)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func trailing(_ anchor: NSLayoutXAxisAnchor, _ offset: CGFloat = 0) {
        base.trailingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func trailingToSuperview(_ offset: CGFloat = 0) {
        if let view = base.superview {
            trailing(view.trailingAnchor, offset)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func bottom(_ anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        base.bottomAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func bottomToSuperview(_ offset: CGFloat = 0) {
        if let view = base.superview {
            bottom(view.bottomAnchor, offset)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func top(_ anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        base.topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func topToSuperview(_ offset: CGFloat = 0) {
        if let view = base.superview {
            top(view.bottomAnchor, offset)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func centerX(_ anchor: NSLayoutXAxisAnchor, _ offset: CGFloat = 0) {
        base.centerXAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func centerXToSuperview(_ offset: CGFloat = 0) {
        if let view = base.superview {
            centerX(view.centerXAnchor, offset)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func updateCenterX(_ offset: CGFloat = 0) {
        let superView = base.superview
        let constraint = superView?.constraints.first(where: { $0.firstAnchor == base.centerXAnchor })
        constraint?.constant = offset
        superView?.setNeedsLayout()
    }
    
    public func centerY(_ anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        base.centerYAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func centerYToSuperview(_ offset: CGFloat = 0) {
        if let view = base.superview {
            centerY(view.centerYAnchor, offset)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func center(_ view: UIView) {
        centerX(view.centerXAnchor)
        centerY(view.centerYAnchor)
    }
    
    public func centerToSuperview() {
        if let view = base.superview {
            center(view)
        } else {
            assertionFailure("It has no superview.")
        }
    }
    
    public func edge(_ view: UIView) {
        top(view.topAnchor)
        bottom(view.bottomAnchor)
        leading(view.leadingAnchor)
        trailing(view.trailingAnchor)
    }
    
    public func edgeToSuperview() {
        if let view = base.superview {
            edge(view)
        } else {
            assertionFailure("It has no superview.")
        }
    }

    public func edge(_ layoutGuide: UILayoutGuide) {
        top(layoutGuide.topAnchor)
        bottom(layoutGuide.bottomAnchor)
        leading(layoutGuide.leadingAnchor)
        trailing(layoutGuide.trailingAnchor)
    }
    
    public func make(_ handler: (_ view: Self) -> Void) {
        base.translatesAutoresizingMaskIntoConstraints = false
        handler(self)
    }
}
