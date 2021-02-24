//
//  Image.swift
//  PDKit
//
//  Created by deng on 2021/2/24.
//

import UIKit

extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = .init(width: 1, height: 1), cornerRaius: CGFloat = 0) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!;
        context.setFillColor(color.cgColor);
        context.fill(rect);

        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if (cornerRaius > 0) {
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            UIBezierPath(roundedRect: rect, cornerRadius: cornerRaius).addClip()
            image?.draw(in: rect)
            image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }

        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
