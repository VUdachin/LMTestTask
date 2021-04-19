//
//  UiTextField+Extension.swift
//  LMTestTask
//
//  Created by Vladimir Udachin on 19.04.2021.
//

import UIKit

extension UITextField {
    
    func setPlaceholderInset(_ value: CGFloat) {
        let insetView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.size.height))
        leftView = insetView
        leftViewMode = .always
    }
}
