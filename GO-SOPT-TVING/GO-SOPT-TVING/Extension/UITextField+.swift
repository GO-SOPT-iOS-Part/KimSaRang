//
//  UITextField+.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/21.
//

import UIKit

extension UITextField {
    //텍스트필드 터치 시 테두리 컬러 변경
    func setPlaceholderColor(_ placeholderColor: UIColor) {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [
                    .foregroundColor: placeholderColor,
                    .font: font
                ].compactMapValues { $0 }
            )
        }
    
    
    func setLeftPaddingPoints(_ amount:CGFloat){ //왼쪽에 여백 주기
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
     
    func setRightPaddingPoints(_ amount:CGFloat) { //오른쪽에 여백 주기
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    
    
}

