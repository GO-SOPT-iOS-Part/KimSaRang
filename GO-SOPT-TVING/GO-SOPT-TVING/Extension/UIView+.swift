//
//  UIView+.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/21.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
