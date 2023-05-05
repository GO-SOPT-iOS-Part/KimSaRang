import UIKit
import Foundation

struct MyPageSeList {
    
    enum UserSetList: String, CaseIterable {
        case ticket = "이용권"
        case inquiryDetails = "1:1 문의내역"
        case reservationNotification = "예약알림"
        case informationModification = "회원정보 수정"
        case promotionAgreement = "프로모션 정보 수신 동의"
    }
    
    enum AppSetList: String, CaseIterable {
        case notice = "공지사항"
        case event = "이벤트"
        case serviceCenter = "고객센터"
        case more = "티빙 알아보기"
    }
    
    var userSetList = UserSetList.allCases.map { $0.rawValue }
    var appSetList = AppSetList.allCases.map { $0.rawValue }
}

