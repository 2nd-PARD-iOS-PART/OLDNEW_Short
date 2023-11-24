////
////  WriteViewController.swift
////  Short iOS
////
////  Created by 박서윤 on 2023/11/25.
////
//
//import UIKit
//
//class WriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    var titleTextField: UITextField?
//    var contentTextView: UITextField?
//    var writerTextField: UITextField?
//    var imageView: UIImageView?
////    let selectImageButton = UIButton(type: .system)
//    var selectedImage: UIImage? = nil
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    func setupUI() {
//        // Title TextField
//        titleTextField = UITextField()
//        titleTextField?.placeholder = "Title"
//        titleTextField?.contentVerticalAlignment = .center
//        titleTextField?.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
//        titleTextField?.translatesAutoresizingMaskIntoConstraints = false
//        if let titleTextField = titleTextField {
//            view.addSubview(titleTextField)
//        }
//        
//        // Content TextView
//        contentTextView = UITextField()
//        contentTextView?.placeholder = "Content"
//        contentTextView?.contentVerticalAlignment = .center
//        contentTextView?.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
//        contentTextView?.translatesAutoresizingMaskIntoConstraints = false
//        if let contentTextView = contentTextView {
//            view.addSubview(contentTextView)
//        }
//        
//        // Writer TextField
//        writerTextField = UITextField()
//        writerTextField?.placeholder = "Writer"
//        writerTextField?.contentVerticalAlignment = .center
//        writerTextField?.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
//        writerTextField?.translatesAutoresizingMaskIntoConstraints = false
//        if let writerTextField = writerTextField {
//            view.addSubview(writerTextField)
//        }
//        
//        // Image View
//        imageView = UIImageView()
//        imageView?.backgroundColor = UIColor.white
//        imageView?.isUserInteractionEnabled = true
//        imageView?.translatesAutoresizingMaskIntoConstraints = false
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImageTapped(_:)))
//        if let imageView = imageView {
//            imageView.addGestureRecognizer(tapGesture)
//            view.addSubview(imageView)
//        }
//        
//
//        // Submit Button
//        let submitButton = UIButton(type: .system)
//        submitButton.setTitle("Submit", for: .normal)
//        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
//        submitButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(submitButton)
//        
//        // Constraints
//        let margins = view.layoutMarginsGuide
//        
//        NSLayoutConstraint.activate([
//            titleTextField?.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
//            titleTextField?.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            titleTextField?.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            titleTextField?.heightAnchor.constraint(equalToConstant: 40),
//            
//            contentTextView?.topAnchor.constraint(equalTo: titleTextField?.bottomAnchor ?? margins.topAnchor, constant: 20),
//            contentTextView?.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            contentTextView?.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            contentTextView?.heightAnchor.constraint(equalToConstant: 40),
//            
//            writerTextField?.topAnchor.constraint(equalTo: contentTextView?.bottomAnchor ?? margins.topAnchor, constant: 20),
//            writerTextField?.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            writerTextField?.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            writerTextField?.heightAnchor.constraint(equalToConstant: 40),
//            
//            imageView?.topAnchor.constraint(equalTo: writerTextField?.bottomAnchor ?? margins.topAnchor, constant: 20),
//            imageView?.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            imageView?.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            imageView?.heightAnchor.constraint(equalToConstant: 150),
//            
//            submitButton.topAnchor.constraint(equalTo: imageView?.bottomAnchor ?? margins.topAnchor, constant: 20),
//            submitButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
//            submitButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
//            submitButton.heightAnchor.constraint(equalToConstant: 40)
//        ]
//
//            .compactMap { $0 })
//    }
//    
//    
//    @objc func selectImageTapped(_ sender: UITapGestureRecognizer) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .photoLibrary
//        present(imagePickerController, animated: true, completion: nil)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[.originalImage] as? UIImage {
//            selectedImage = pickedImage
//            imageView?.image = pickedImage
//        }
//        dismiss(animated: true, completion: nil)
//    }
//    
//    @objc func submitTapped() {
//        // Handle the submission logic here
//    }
//}
//
//




import UIKit

class WriteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var titleTextField: UITextField?
    var contentTextView: UITextField?
    var writerTextField: UITextField?
    var imageView: UIImageView?
    var selectedImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        // Title TextField
        titleTextField = UITextField()
        titleTextField?.placeholder = "제목을 입력해주세요"
        titleTextField?.contentVerticalAlignment = .center
        titleTextField?.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
        titleTextField?.translatesAutoresizingMaskIntoConstraints = false
        styleTextField(textField: titleTextField) // 스타일링 함수 호출
        if let titleTextField = titleTextField {
            view.addSubview(titleTextField)
        }
        
        // Content TextView
        contentTextView = UITextField()
        contentTextView?.placeholder = "내용을 입력해주세요"
        contentTextView?.contentVerticalAlignment = .center
        contentTextView?.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
        contentTextView?.translatesAutoresizingMaskIntoConstraints = false
        styleTextField(textField: contentTextView) // 스타일링 함수 호출
        if let contentTextView = contentTextView {
            view.addSubview(contentTextView)
        }
        
        // Writer TextField
        writerTextField = UITextField()
        writerTextField?.placeholder = "보내는 사람"
        writerTextField?.contentVerticalAlignment = .center
        writerTextField?.font = UIFont.systemFont(ofSize: 14) // Adjust font size as needed
        writerTextField?.translatesAutoresizingMaskIntoConstraints = false
        styleTextField(textField: writerTextField) // 스타일링 함수 호출
        if let writerTextField = writerTextField {
            view.addSubview(writerTextField)
        }
        
        // Image View
        imageView = UIImageView()
        imageView?.backgroundColor = UIColor.white
        imageView?.isUserInteractionEnabled = true
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImageTapped(_:)))
        imageView?.addGestureRecognizer(tapGesture)
        view.addSubview(imageView!)
        
        // Submit Button
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            //            titleTextField!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            //            titleTextField!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            titleTextField!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            //            titleTextField!.heightAnchor.constraint(equalToConstant: 40),
            //
            
            
            titleTextField!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField!.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleTextField!.widthAnchor.constraint(equalToConstant: 329),
            titleTextField!.heightAnchor.constraint(equalToConstant: 46),
            
            
            
            contentTextView!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentTextView!.topAnchor.constraint(equalTo: titleTextField!.bottomAnchor, constant: 20),
            //            contentTextView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //            contentTextView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView!.widthAnchor.constraint(equalToConstant: 329),
            contentTextView!.heightAnchor.constraint(equalToConstant: 400),
            
            
            writerTextField!.topAnchor.constraint(equalTo: contentTextView!.bottomAnchor, constant: 20),
            //            writerTextField!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            writerTextField!.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            writerTextField!.widthAnchor.constraint(equalToConstant: 329),
            writerTextField!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            writerTextField!.heightAnchor.constraint(equalToConstant: 46),
            
            
            imageView!.topAnchor.constraint(equalTo: writerTextField!.bottomAnchor, constant: 20),
            imageView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView!.heightAnchor.constraint(equalToConstant: 20),
            
            submitButton.topAnchor.constraint(equalTo: imageView!.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // 스타일링 함수
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
    
    //    @objc func selectImageTapped(_ sender: UITapGestureRecognizer) {
    //        let imagePickerController = UIImagePickerController()
    //        imagePickerController.delegate = self
    //        imagePickerController.sourceType = .photoLibrary
    //        present(imagePickerController, animated: true, completion: nil)
    //    }
    //
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    //        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
    //            selectedImage = pickedImage
    //            imageView?.image = pickedImage
    //        }
    //        dismiss(animated: true, completion: nil)
    //    }
    //
    //    @objc func submitTapped() {
    //        // Handle the submission logic here
    //    }
    //}
    
    
    
    
    @objc func selectImageTapped(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func submitTapped() {
    //        // Handle the submission logic here
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
            imageView?.image = pickedImage
            
            // Set the selected image as the background of the view
            if let bgImage = selectedImage {
                view.backgroundColor = UIColor(patternImage: bgImage)
            }
        }
        
        
        dismiss(animated: true, completion: nil)
    }
}
