//
//  LoginViewController.swift
//  GO-SOPT-TVING
//
//  Created by 김사랑 on 2023/04/21.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {

    private lazy var loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setLayout()
        setReact()
        // Do any additional setup after loading the view.
    }

    func configureUI() {
        view.addSubview(loginView)
    }

    func setLayout() {
        loginView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

    func setReact() {
        loginView.idTextField.delegate = self
        loginView.passwordTextField.delegate = self
        loginView.loginButton.addTarget(self, action: #selector(tappedLogInButton), for: .touchUpInside)
        loginView.clearIDButton.addTarget(self, action: #selector(tappedClearIDButton), for: .touchUpInside)
        loginView.clearPWButton.addTarget(self, action: #selector(tappedClearPWButton), for: .touchUpInside)
        loginView.securityButton.addTarget(self, action: #selector(tappedSecurityButton), for: .touchUpInside)
    }

    func hideButton() {
        loginView.clearIDButton.isHidden = true
        loginView.clearPWButton.isHidden = true
        loginView.securityButton.isHidden = true
    }

    func showButton() {
        loginView.clearIDButton.isHidden = true
        loginView.clearPWButton.isHidden = false
        loginView.securityButton.isHidden = false
    }

    @objc
    func tappedLogInButton() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.userName(name: loginView.idTextField.text ?? "")
        navigationController?.pushViewController(welcomeVC, animated: true)
    }

    @objc
    func tappedClearIDButton() {
        loginView.idTextField.text = ""
        hideButton()
    }

    @objc
    func tappedClearPWButton() {
        loginView.passwordTextField.text = ""
        hideButton()
    }

    @objc
    func tappedSecurityButton() {
        loginView.passwordTextField.isSecureTextEntry = !loginView.passwordTextField.isSecureTextEntry
    }

}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginView.idTextField {
            loginView.passwordTextField.becomeFirstResponder()
        } else if textField == loginView.passwordTextField {
            textField.resignFirstResponder()
            tappedLogInButton()
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let idText = loginView.idTextField.text ?? ""
        let passwordText = loginView.passwordTextField.text ?? ""
        if idText.count > 0 && passwordText.count > 0 {
            loginView.loginButton.isEnabled = true
            loginView.loginButton.backgroundColor = .mainRed
            loginView.loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginView.loginButton.isEnabled = false
            loginView.loginButton.backgroundColor = .black
        }
        return true
    }

}
