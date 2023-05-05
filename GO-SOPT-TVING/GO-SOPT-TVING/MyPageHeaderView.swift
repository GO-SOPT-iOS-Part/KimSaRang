import UIKit
import Then
import SnapKit

final class MyPageHeaderView: UIView {
    // MARK: - UI Components
    
    private let profileImageView = UIImageView().then {
        $0.image = UIImage(named: "dog")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "DOG"
        $0.font = .tvingMedium(ofSize: 17)
        $0.textColor = .white
    }
    
    private let profileChangeButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.titleLabel?.font = .tvingMedium(ofSize: 10)
        $0.layer.borderColor = UIColor.textGrey4.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 2
    }
    
    private let backView = UIView().then {
        $0.backgroundColor = .back19
        $0.layer.cornerRadius = 3
    }
    
//    private let ticketImageView = UIImageView().then {
//        $0.image = UIImage(named: "ticket")
//        $0.tintColor = .textGrey3
//        $0.contentMode = .scaleAspectFit
//    }
//
//    private let ticketLabel = UILabel().then {
//        $0.text = "나의 이용권"
//        $0.textColor = .textGrey3
//        $0.font = .tvingMedium(ofSize: 13)
//    }
    
//    private let cashImageView = UIImageView().then {
//        $0.image = UIImage(named: "cash")
//        $0.tintColor = .textGrey3
//        $0.contentMode = .scaleAspectFit
//    }
//
//    private let cashLabel = UILabel().then {
//        $0.text = "티빙 캐시"
//        $0.textColor = .textGrey3
//        $0.font = .tvingMedium(ofSize: 13)
//    }
    
//    private let myTicketLabel = UILabel().then {
//        $0.text = "사용중인 이용권이 없습니다."
//        $0.textColor = .textGrey3
//        $0.font = .tvingMedium(ofSize: 13)
//    }
    
//    private let myCashLabel = UILabel().then {
//        $0.text = "0"
//        $0.textColor = .white
//        $0.font = .tvingBold(ofSize: 15)
//    }
    
    private let ticketStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 4
//        $0.setCustomSpacing(5, after: ticketImageView)
//        $0.setCustomSpacing(78, after: ticketLabel)
        
        let ticketImageView = UIImageView().then {
            $0.image = UIImage(named: "ticket")
            $0.tintColor = .textGrey3
            $0.contentMode = .scaleAspectFit
            $0.snp.makeConstraints {
                $0.size.equalTo(23)
            }
        }
        
        let ticketLabel = UILabel().then {
            $0.text = "나의 이용권"
            $0.textColor = .textGrey3
            $0.font = .tvingMedium(ofSize: 13)
            $0.snp.makeConstraints {
                $0.width.greaterThanOrEqualTo(ticketImageView)
            }
            
        }
        
        let myTicketLabel = UILabel().then {
            $0.text = "사용중인 이용권이 없습니다."
            $0.textColor = .textGrey3
            $0.font = .tvingMedium(ofSize: 13)
            
        }
    }
    
    private let cashStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .fill
        $0.spacing = 4
//        $0.setCustomSpacing(5, after: ticketImageView)
//        $0.setCustomSpacing(78, after: ticketLabel)
        
        let cashImageView = UIImageView().then {
            $0.image = UIImage(named: "cash")
            $0.tintColor = .textGrey3
            $0.contentMode = .scaleAspectFit
            $0.snp.makeConstraints {
                $0.size.equalTo(23)
            }
        }
        
        let cashLabel = UILabel().then {
            $0.text = "티빙 캐시"
            $0.textColor = .textGrey3
            $0.font = .tvingMedium(ofSize: 13)
            $0.snp.makeConstraints {
                $0.width.greaterThanOrEqualTo(cashImageView)
            }
        }
        
        let myCashLabel = UILabel().then {
            $0.text = "0"
            $0.textColor = .white
            $0.font = .tvingBold(ofSize: 15)
        }
    }
    
    private let backStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.spacing = 20
    }
    
    
    // MARK: - Lift Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension MyPageHeaderView {
    func style() {
        self.backgroundColor = .black
        [profileImageView,
         nameLabel,
         profileChangeButton,
         backView].forEach {
            self.addSubview($0)
        }
        
        backView.addSubviews(backStackView)
    }
    
    
    func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview()
            $0.size.equalTo(74)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(22)
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(25)
            $0.centerY.equalTo(profileImageView)
            $0.trailing.equalToSuperview()
        }
        
        backView.snp.makeConstraints {
            $0.width.equalTo(355)
            $0.height.equalTo(92)
            $0.top.equalTo(profileImageView.snp.bottom).offset(29)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        backStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(18)
        }
    
    }
    
}
