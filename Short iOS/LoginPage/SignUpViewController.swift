//
//  SignUpViewController.swift
//  Short iOS
//
//  Created by 이신원 on 2023/11/25.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sky_moon") // 배경 이미지 파일명으로 변경하세요.
        return imageView
    }()
    
    private let usernameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .none
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let pwLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.textColor = .white
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var signUpButton: UIButton = {
        var button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.primary
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        // 버튼 윤곽 둥글게 설정
        button.layer.cornerRadius = 8 // 원하는 'cornerRadius' 값으로 설정
        button.layer.masksToBounds = true
        
        return button
    }()
    
    @objc private func handleLogin() {
        //        guard let username = usernameTextField.text, !username.isEmpty,
        //              let password = passwordTextField.text, !password.isEmpty else {
        //            updateTextFieldBorders(withError: true)
        //            return
        //        }
        //
        //        if authenticateUser(username: username, password: password) {
        //            navigateToHomePage()
        //        } else {
        //            updateTextFieldBorders(withError: true)
        //        }
        
        let homeVC = HomeViewController( )
        //homeVC.delegate = self  // Set the delegate
        navigationController?.pushViewController(homeVC, animated: true)

     
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
//        usernameTextField.delegate = self
//        passwordTextField.delegate = self
        
    }
    
    
    func setupUI() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = view.bounds
       
        view.addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        let lineView1 = UIView()
        lineView1.backgroundColor = .white // 흰색 배경 설정
        lineView1.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lineView1)
        
        view.addSubview(pwLabel)
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        let lineView2 = UIView()
        lineView2.backgroundColor = .white // 흰색 배경 설정
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lineView2)
        
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: -25),
            idLabel.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            
            lineView1.heightAnchor.constraint(equalToConstant: 1),
            lineView1.widthAnchor.constraint(equalToConstant: 250),
            
            // 선을 화면에 꽉 차게 설정합니다.
            lineView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // 선의 위치를 뷰의 상단에서 100포인트 아래로 설정합니다.
            lineView1.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            
            
            pwLabel.topAnchor.constraint(equalTo: lineView1.bottomAnchor, constant: 20),
            pwLabel.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: pwLabel.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor),
            
            
            lineView2.heightAnchor.constraint(equalToConstant: 1),
            lineView2.widthAnchor.constraint(equalToConstant: 250),
            // 선을 화면에 꽉 차게 설정합니다.
            lineView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // 선의 위치를 뷰의 상단에서 100포인트 아래로 설정합니다.
            lineView2.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            signUpButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
        ])
    }
    
}
    
