//
//  UIStackView+.swift
//  assignment
//
//  Created by 신혜연 on 11/11/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
