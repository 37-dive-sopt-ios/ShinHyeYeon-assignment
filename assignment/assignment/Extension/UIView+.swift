//
//  UIView+.swift
//  assignment
//
//  Created by 신혜연 on 10/31/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
