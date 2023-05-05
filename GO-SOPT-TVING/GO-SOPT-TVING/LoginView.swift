//
//  LoginView.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/21.
//

import UIKit
import Then
import SnapKit

class LoginView: UIView {
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_before"), for: .normal)
    }
    
    private let loginLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = .tvingMedium(ofSize: 23)
        $0.textColor = .textGrey1
        $0.textAlignment = .center
    }
    
    public let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.textColor = .textGrey2
        $0.backgroundColor = .textGrey4
        $0.keyboardType = .default
//        if let clearButton = $0.value(forKeyPath: "_clearButton") as? UIButton {
//            clearButton.setImage(UIImage(named: "x-circle"), for: .normal)
//        }
//
//        if let clearButton = $0.value(forKeyPath: "_clearButton") as? UIButton {
//            clearButton.setImage(UIImage(named: "x-circle"), for: .normal)
//            let buttonSize = CGSize(width: 20, height: 20) // 원하는 크기로 수정
//            clearButton.frame = CGRect(origin: clearButton.frame.origin, size: buttonSize)
//        }
//
        $0.clearButtonMode = UITextField.ViewMode.whileEditing
        $0.setLeftPaddingPoints(22)
        $0.layer.cornerRadius = 3
        $0.autocapitalizationType = .none
        $0.setPlaceholderColor(.textGrey2)
    }
    
    public let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .tvingSemiBold(ofSize: 15)
        $0.textColor = .textGrey2
        $0.backgroundColor = .textGrey4
        $0.keyboardType = .default
//
//        //Clear Button 이미지 변경
//        if let clearButton = $0.value(forKeyPath: "_clearButton") as? UIButton {
//            clearButton.setImage(UIImage(named: "x-circle"), for: .normal)
//        }
        //텍스트필드에 글자를 쓰고 있을때 클리어 버튼이 나타나도록
        $0.clearButtonMode = UITextField.ViewMode.whileEditing

        $0.setLeftPaddingPoints(22)
        $0.layer.cornerRadius = 3
        $0.autocapitalizationType = .none
        $0.setPlaceholderColor(.textGrey2)
        $0.isSecureTextEntry = true
    }
    
    public lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.setTitleColor(.textGrey2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.textGrey4.cgColor
        $0.titleLabel?.textAlignment = .center
        $0.layer.cornerRadius = 3
    }
    
    public lazy var findIDButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.setTitleColor(.textGrey2, for: .normal)
        $0.titleLabel?.textAlignment = .center
    }
    
    private let separator = UIView().then {
        $0.backgroundColor = .textGrey4
    }
    
    public lazy var findPWButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.titleLabel?.font = .tvingSemiBold(ofSize: 14)
        $0.setTitleColor(.textGrey2, for: .normal)
        $0.titleLabel?.textAlignment = .center
    }
    
    private let existAccountLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.font = .tvingSemiBold(ofSize: 14)
        $0.textColor = .textGrey3
        $0.textAlignment = .center
    }
    
    public lazy var makeNicknameButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.setTitleColor(.textGrey2, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.setUnderline()
    }

    public lazy var clearIDButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.isEnabled = false
        $0.isHidden = true
//        $0.addTarget(self, action: #selector(self.clearTextField), for: .touchUpInside)
    }
    
    public lazy var clearPWButton = UIButton().then {
        $0.setImage(UIImage(named: "x-circle"), for: .normal)
        $0.isEnabled = false
        $0.isHidden = true
//        $0.addTarget(self, action: #selector(self.clearTextField), for: .touchUpInside)
    }
    
    public lazy var securityButton = UIButton().then {
        $0.setImage(UIImage(named: "eye-slash"), for: .normal)
        $0.isEnabled = false
        $0.isUserInteractionEnabled = true
        $0.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

private extension LoginView {
    
    func style() {
        self.backgroundColor = .black
        [backButton,
         loginLabel,
         idTextField,
         passwordTextField,
         loginButton,
         findIDButton,
         separator,
         findPWButton,
         existAccountLabel,
         makeNicknameButton,
         clearIDButton,
         clearPWButton,
         securityButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        
        backButton.snp.makeConstraints{
            $0.height.equalTo(15)
            $0.width.equalTo(8)
            $0.top.equalToSuperview().offset(69)
            $0.leading.equalToSuperview().offset(24)
        }
        
        loginLabel.snp.makeConstraints{
            $0.height.equalTo(37)
            $0.top.equalTo(backButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        
        idTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(loginLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        findIDButton.snp.makeConstraints{
//            $0.width.equalTo(62)
            $0.height.equalTo(22)
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
        }
        
        separator.snp.makeConstraints{
            $0.height.equalTo(12)
            $0.width.equalTo(1)
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.leading.equalTo(180)
//            $0.trailing.equalTo(195)
        }
        
        findPWButton.snp.makeConstraints{
//            $0.width.equalTo(73)
            $0.height.equalTo(22)
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.trailing.equalToSuperview().inset(86)
        }
        
        existAccountLabel.snp.makeConstraints{
//            $0.width.equalTo(129)
            $0.height.equalTo(22)
            $0.top.equalTo(findIDButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(51)
        }
        
        makeNicknameButton.snp.makeConstraints{
            $0.width.equalTo(128)
            $0.height.equalTo(22)
            $0.top.equalTo(findIDButton.snp.bottom).offset(28)
            $0.trailing.equalToSuperview().inset(50)
        }
        
        clearIDButton.snp.makeConstraints{
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-14)
            $0.centerY.equalTo(idTextField.snp.centerY)
        }


        clearPWButton.snp.makeConstraints{
            $0.size.equalTo(20)
            $0.trailing.equalTo(passwordTextField).offset(-56)
            $0.centerY.equalTo(passwordTextField.snp.centerY)
        }
        
        securityButton.snp.makeConstraints{
            $0.size.equalTo(20)
            $0.trailing.equalTo(passwordTextField).inset(20)
            $0.centerY.equalTo(passwordTextField)
        }
        
        
    }
}
