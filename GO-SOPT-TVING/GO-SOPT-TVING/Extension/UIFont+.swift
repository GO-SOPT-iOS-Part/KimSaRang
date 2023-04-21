//
//  UIFont+.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/20.
//

import UIKit

extension UIFont {
    
    class func tvingRegular(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Regular", size: size)!
    }
    
    class func tvingMedium(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Medium", size: size)!
    }
    
    class func tvingSemiBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
    
    class func tvingBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
}


//#사용시
//private lazy var startButton = UIButton().then {
//        $0.setTitle("티빙", for: .normal)
//                $0.titleLabel?.font = .tvingSemiBold(ofSize: 18)
//    }
