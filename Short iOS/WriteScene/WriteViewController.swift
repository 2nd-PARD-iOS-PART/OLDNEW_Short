//
//  WriteViewController.swift
//  Short iOS
//
//  Created by 박서윤 on 2023/11/25.
//

import UIKit

protocol WriteViewControllerDelegate: AnyObject {
    func didSubmitContent(_ content: String)
}
class WriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var data : [GetLetterData] = []
    weak var delegate: WriteViewControllerDelegate? // Delegate property

    private lazy var sendButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blue // You can customize this
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var titleTextField: UITextField?
    var contentTextView: UITextField?
    var writerTextField: UITextField?
    var imageView: UIImageView?
    var selectedImage: UIImage? = nil


        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            setupIconButtons()
            setBackgroundToSkyImage()
            setupSendButton()
        }

    func setupUI() {
        // Title TextField
        titleTextField = UITextField()
        titleTextField?.placeholder = "제목을 입력해주세요"
        titleTextField?.contentVerticalAlignment = .center
        titleTextField?.font = UIFont.systemFont(ofSize: 14)
        titleTextField?.translatesAutoresizingMaskIntoConstraints = false
        styleTextField(textField: titleTextField)
        if let titleTextField = titleTextField {
            view.addSubview(titleTextField)
        }
        
        // Content TextView
        contentTextView = UITextField()
        contentTextView?.placeholder = "내용을 입력해주세요"
        contentTextView?.contentVerticalAlignment = .center
        contentTextView?.font = UIFont.systemFont(ofSize: 14)
        contentTextView?.translatesAutoresizingMaskIntoConstraints = false
        styleTextField(textField: contentTextView)
        if let contentTextView = contentTextView {
            view.addSubview(contentTextView)
        }
        
        // Writer TextField
        writerTextField = UITextField()
        writerTextField?.placeholder = "보내는 사람"
        writerTextField?.contentVerticalAlignment = .center
        writerTextField?.font = UIFont.systemFont(ofSize: 14)
        writerTextField?.translatesAutoresizingMaskIntoConstraints = false
        styleTextField(textField: writerTextField)
        if let writerTextField = writerTextField {
            view.addSubview(writerTextField)
        }
        
        
        // Constraints
        NSLayoutConstraint.activate([
            titleTextField!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField!.topAnchor.constraint(equalTo: view.topAnchor, constant: 147),
            titleTextField!.widthAnchor.constraint(equalToConstant: 329),
            titleTextField!.heightAnchor.constraint(equalToConstant: 46),
            
            
            contentTextView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentTextView!.topAnchor.constraint(equalTo: titleTextField!.bottomAnchor, constant: 20),
            contentTextView!.widthAnchor.constraint(equalToConstant: 329),
            contentTextView!.heightAnchor.constraint(equalToConstant: 400),
            
            
            writerTextField!.topAnchor.constraint(equalTo: contentTextView!.bottomAnchor, constant: 20),
            writerTextField!.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            writerTextField!.widthAnchor.constraint(equalToConstant: 133),
            writerTextField!.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    private func setupSendButton() {
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sendButton.widthAnchor.constraint(equalToConstant: 150),
            sendButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    func styleTextField(textField: UITextField?) {
        textField?.borderStyle = .none
        textField?.backgroundColor = UIColor(white: 1, alpha: 0.5) // 반투명 배경
        textField?.layer.cornerRadius = 15 // 둥근 모서리
        textField?.layer.shadowOpacity = 0.2 // 그림자 투명도
        textField?.layer.shadowRadius = 5 // 그림자 반경
        textField?.layer.shadowOffset = CGSize(width: 0, height: 2) // 그림자 방향
        textField?.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        
        // 텍스트 필드의 내부 여백 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField!.frame.height))
        textField?.leftView = paddingView
        textField?.leftViewMode = .always
        textField?.rightView = paddingView
        textField?.rightViewMode = .always
    }

        func setBackgroundToSkyImage() {
            if let bgImage = UIImage(named: "sky") {
                view.backgroundColor = UIColor(patternImage: bgImage)
            }
        }

    func setupIconButtons() {
        // Select 버튼
        let selectImageIcon = UIImage(named: "selectimageicon")?.withRenderingMode(.alwaysOriginal) // 아이콘 이미지의 렌더링 모드 설정
        let selectImageButton = UIBarButtonItem(image: selectImageIcon, style: .plain, target: self, action: #selector(selectImageTapped(_:)))
        
        // Submit 버튼
        if let paperplaneImage = UIImage(systemName: "paperplane")?.withTintColor(.white, renderingMode: .alwaysOriginal) {
                let submitImageButton = UIBarButtonItem(image: paperplaneImage, style: .plain, target: self, action: #selector(submitTapped))
                navigationItem.rightBarButtonItems = [submitImageButton, selectImageButton]
            }
    }

    @objc func selectImageTapped(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }

    @objc func submitTapped() {
        // Extract data from text fields and image view
       
        guard let title = titleTextField?.text, !title.isEmpty,
              let sender = writerTextField?.text, !sender.isEmpty,
              let content = contentTextView?.text, !content.isEmpty
        else {
            print("Error: Some fields are empty")
            return
        }
    
        // Call APIcaller to make the post request
        APIcaller.shared.makePostRequestLetter(with: "user undetected", roomCode: "not roomcode", title: title, sender: sender, content: content)
//        APIcaller.shared.getLetterData { [weak self]  result in
//            switch result {
//            case .success(let data):
//
//            }
//        }
    }

}

//[weak self] result in
/*
 case .success(let data):
     // 가져온 데이터를 ViewController의 userData 배열에 저장
     self?.data = data
     // 테이블 뷰를 메인 스레드에서 업데이트
     DispatchQueue.main.async {
         self?.tableView.reloadData()
     }
     case .failure(let error):
         print("API call error: \(error)")
     }
 }
 
 */






