import UIKit
import SnapKit
import Then

class MainHomeViewController: UIViewController {
    
    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UI Components
    
    public var gotoMyPageButton = UIButton().then {
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.layer.cornerRadius = 15
//        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.setImage(UIImage(named: "dog"), for: .normal)
//        $0.addTarget(self, action: #selector(gotoMyPage), for: .touchUpInside)
    }
    

    // MARK: - Functions
    
    func style() {
        view.backgroundColor = .black
        view.addSubviews(gotoMyPageButton)
    }
    
    func setLayout() {
        gotoMyPageButton.snp.makeConstraints {
            $0.size.equalTo(33)
            $0.leading.equalToSuperview().inset(333)
            $0.top.equalToSuperview().inset(55)
        }
    }
    
//    @objc
//    func gotoMyPage() {
//        let myPageViewController = MyPageViewController()
//        self.navigationController?.pushViewController(myPageViewController, animated: true)
//    }

    
}



// MARK: - Property
// MARK: - UI Components
// MARK: - Target
// MARK: - Lift Cycle
// MARK: - style
// MARK: - layout
// MARK: - Functions
