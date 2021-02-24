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
    private var width: NSLayoutDimension { base.widthAnchor }
    private var height: NSLayoutDimension { base.heightAnchor }
    private var leading: NSLayoutXAxisAnchor { base.leadingAnchor }
    private var trailing: NSLayoutXAxisAnchor { base.trailingAnchor }
    private var top: NSLayoutYAxisAnchor { base.topAnchor }
    private var bottom: NSLayoutYAxisAnchor { base.bottomAnchor }
    private var centerY: NSLayoutYAxisAnchor { base.centerYAnchor }
    private var centerX: NSLayoutXAxisAnchor { base.centerXAnchor }
    
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
    
    public func trailing(_ anchor: NSLayoutXAxisAnchor, _ offset: CGFloat = 0) {
        base.trailingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func bottom(_ anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        base.bottomAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func top(_ anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        base.topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func centerX(_ anchor: NSLayoutXAxisAnchor, _ offset: CGFloat = 0) {
        base.centerXAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func centerY(_ anchor: NSLayoutYAxisAnchor, _ offset: CGFloat = 0) {
        base.centerYAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    public func center(_ view: UIView) {
        centerX(view.centerXAnchor)
        centerY(view.centerYAnchor)
    }
    
    public func centerToSuperview() {
        if let view = base.superview {
            center(view)
        } else {
            assertionFailure("该视图没有父视图。")
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
            assertionFailure("该视图没有父视图。")
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
