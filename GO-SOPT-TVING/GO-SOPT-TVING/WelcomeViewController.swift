//
//  WelcomeViewController.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var user: String?
    
    func userName(name: String){
        user = name
    }
    
    private let mainImageView = UIImageView().then {
        $0.image = UIImage(named: "tving-logo")
        $0.contentMode = .scaleAspectFill
    }
    
    public let welcomeLabel = UILabel().then {
        $0.text = "님\n반가워요!"
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    public lazy var gotoMainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.titleLabel?.textAlignment = .center
        $0.backgroundColor = .mainRed
        $0.layer.cornerRadius = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        setNavigationBar()
        dataBind()
    }
    
    func dataBind() {
        guard let id = self.user else { return }
        welcomeLabel.text = "\(id)님\n반가워요!"
    }
    
    func style(){
        view.backgroundColor = .black
        view.addSubviews(mainImageView,
                       welcomeLabel,
                       gotoMainButton)
    }
    
    func setLayout(){
        mainImageView.snp.makeConstraints {
            $0.height.equalTo(210.94)
            $0.top.equalToSuperview().offset(58)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints {
            $0.height.equalTo(74)
            $0.top.equalTo(mainImageView.snp.bottom).offset(67.06)
            $0.leading.equalToSuperview().offset(75)
            $0.centerX.equalToSuperview()
        }
        gotoMainButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(284)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        gotoMainButton.addTarget(self, action: #selector(gotoMainButtonPressed), for: .touchUpInside)
    }
    
    func setNavigationBar(){
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc private func gotoMainButtonPressed() {
        let LoginView = LoginViewController()
            navigationController?.pushViewController(LoginView, animated: true)
    }
}
