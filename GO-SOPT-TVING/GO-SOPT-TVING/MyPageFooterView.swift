import UIKit
import Then
import SnapKit

final class MyPageFooterView: UIView {
    //MARK: - UI Components
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.textGrey2, for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 14)
        $0.layer.borderColor = UIColor.textGrey4.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 2
    }
    
    private let isLastSection: Bool
    
    // MARK: - Lift Cycle
    
    init(isLastSection: Bool) {
        self.isLastSection = isLastSection
        super.init(frame: .zero)
        
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageFooterView {
    func style() {
        self.backgroundColor = .black
        [logoutButton].forEach {
            self.addSubview($0)
        }
        logoutButton.isHidden = !isLastSection
    }
    
    func setLayout() {
        logoutButton.snp.makeConstraints {
            $0.width.equalTo(359)
            $0.height.equalTo(55)
            $0.centerX.equalToSuperview()
        }
    }
}
