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

    

    weak var delegate: WriteViewControllerDelegate? // Delegate property

    private lazy var sendbutton : UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(submitTapped), for: <#T##UIControl.Event#>)
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
    //
        }
        
        
        


    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            selectedImage = pickedImage
            
            if let bgImage = selectedImage {
                // 배경 이미지로 설정
                view.backgroundColor = UIColor(patternImage: bgImage)
                
                // 이미지뷰 추가
                if imageView == nil {
                    imageView = UIImageView(image: pickedImage)
                    imageView?.frame = view.bounds
                    imageView?.contentMode = .scaleAspectFill
                    imageView?.clipsToBounds = true
                    view.addSubview(imageView!)
                    view.sendSubviewToBack(imageView!)
                } else {
                    imageView?.image = pickedImage // 이미지가 이미 존재하는 경우 이미지 업데이트
                }
            }
        } else {
            // 이미지 선택이 없을 때 'sky' 이미지로 설정
            if let bgImage = UIImage(named: "sky") {
                print("sdf")
                view.backgroundColor = UIColor(patternImage: bgImage)
                imageView?.image = bgImage // 이미지뷰에 'sky' 이미지 업데이트
            } else {
                view.backgroundColor = .white // 'sky' 이미지가 없는 경우 기본 배경 색상 설정
            }
        }
        dismiss(animated: true, completion: nil)
    }


}







