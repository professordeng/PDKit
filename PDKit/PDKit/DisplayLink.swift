//
//  DisplayLink.swift
//  PDKit
//
//  Created by deng on 2021/2/28.
//

import UIKit

public class DisplayLink {
    private class WeakTarget {
        weak var link: DisplayLink?

        init (_ link: DisplayLink) {
            self.link = link
        }

        @objc func callback () {
            guard let link = link else { return }
            link.handler?()
        }
    }
    
    private var link: CADisplayLink?
    private var handler: (() -> Void)?

    public init(_ fps: Int = 60, _ handler: (() -> Void)?) {
        self.handler = handler
        link = CADisplayLink(target: WeakTarget(self), selector: #selector(WeakTarget.callback))
        link?.add(to: .main, forMode: .common)
        link?.preferredFramesPerSecond = fps
    }
    
    deinit {
        link?.invalidate()
        print("#\(self) __deinit__")
    }
}
