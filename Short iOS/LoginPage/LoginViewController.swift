//
//  LoginViewController.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.

import UIKit

class LoginViewController: UIViewController {
    
    //    let realm = RealmStart.realmShared
    //    private var isLoginSuccessful : Bool = false
    // 배경 이미지 뷰
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "sky_moon") // 배경 이미지 파일명으로 변경하세요.
        return imageView
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "모든 것이 새로운 당신을 응원해요."
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0 // 여러 줄로 표시
        //        label.font =
        return label
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
    private lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor.secondary
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        // 버튼 윤곽 둥글게 설정
        button.layer.cornerRadius = 8 // 원하는 'cornerRadius' 값으로 설정
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        var button = UIButton()
        button.setTitle("회원가입", for: .normal )
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        // 버튼 윤곽 둥글게 설정
        button.layer.cornerRadius = 8 // 원하는 'cornerRadius' 값으로 설정
        button.layer.masksToBounds = true

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    func setupUI() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = view.bounds
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
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
        
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
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
            
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            loginButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
        ])
    }
    
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
        
        let writeVC = WriteViewController()
        writeVC.modalPresentationStyle = .fullScreen // 또는 .automatic, .popover 등 다른 스타일을 선택할 수 있습니다
        present(writeVC, animated: true, completion: nil)
    }
    
    
    
    
    private func navigateToHomePage() {
        //        let homePageVC = DetailViewController()
        //        self.navigationController?.pushViewController(homePageVC, animated: true)
        //        print("Login successful")
    }
    
    private func updateTextFieldBorders(withError showError: Bool) {
        let borderColor: CGColor = showError ? UIColor.red.cgColor : UIColor.clear.cgColor
        [usernameTextField, passwordTextField].forEach {
            $0.layer.borderColor = borderColor
            $0.layer.borderWidth = showError ? 1.0 : 0.0
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 사용자가 Return 키를 눌렀을 때 호출.
        if textField == usernameTextField {
            // 사용자 이름 입력 후, 비밀번호 필드로 포커스.
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            // 비밀번호 입력 후, 로그인 처리.
            textField.resignFirstResponder()
            handleLogin()
        }
        return true
    }
}
