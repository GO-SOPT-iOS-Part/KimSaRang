//
//  NewViewController.swift
//  GO-SOPT-FIRST-SEMINAR
//
//  Created by 김사랑 on 2023/04/07.
//

import UIKit

class NewViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요🥸"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
        }()
    
    private let valueSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.minimumTrackTintColor = .black
        return slider
        }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4 //투명도
        button.layer.shadowOffset = CGSize.zero //위치
        button.layer.shadowRadius = 7 //반경

        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self,
                                 action: #selector(presentButtonTapped),
                                 for: .touchUpInside)
        
        return button
        }()
        
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4 //투명도
        button.layer.shadowOffset = CGSize.zero //위치
        button.layer.shadowRadius = 7 //반경
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self,
                                 action: #selector(pushButtonTapped),
                                 for: .touchUpInside)
        
        return button
        }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 적어주세요 :)"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.1
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 15.0, height: 0.0)) //여백주기
        textField.leftViewMode = .always

        return textField
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        // Do any additional setup after loading the view.
    }
    


}

private extension NewViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton, valueSlider].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([valueSlider.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                                     valueSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     valueSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: valueSlider.bottomAnchor, constant: 10),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func presentToSecondViewController() {
            
            let secondViewController = SecondViewController_1st_Seminar()
            secondViewController.modalPresentationStyle = .fullScreen
            self.present(secondViewController, animated: true)
        }
        
    func pushToSecondViewController() {
        
        let secondViewController = SecondViewController_1st_Seminar()
        if let name = nameTextField.text{
            secondViewController.dataBind(name: name)
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
        
        @objc
        func presentButtonTapped() {
            
            presentToSecondViewController()
        }
        
        @objc
        func pushButtonTapped() {
            
            pushToSecondViewController()
        }
    
    
    
}
