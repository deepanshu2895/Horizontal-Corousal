//
//  Extensions.swift
//  Task
//
//  Created by Deepanshu Jain on 11/05/20.
//  Copyright © 2020 Deepanshu Jain. All rights reserved.
//

extension UIImage {
	public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
		let maxRadius = min(size.width, size.height) / 2
		let cornerRadius: CGFloat
		if let radius = radius, radius > 0 && radius <= maxRadius {
			cornerRadius = radius
		} else {
			cornerRadius = maxRadius
		}
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		let rect = CGRect(origin: .zero, size: size)
		UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
		draw(in: rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
}
