//
//  DetailViewController.swift
//  Short iOS
//
//  Created by 진세진 on 2023/11/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal) // Use a system image or your own image
        button.tintColor = .white // Set the color
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let letterview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let authorLabel: UILabel = {
            let label = UILabel()
            label.text = "작성한 사람" // Replace with the actual author's name if needed
            label.font = UIFont.systemFont(ofSize: 12) // Adjust the font size as needed
            label.textColor = .white // Adjust the text color as needed
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    private let backgroundImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.imagename
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "사랑하는 동원"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let bodyTextView : UITextView = {
        let textView = UITextView()
            let text = "나는 누구에요... (rest of your text) 진세지닞니세지니진세지니지네시진진세진"
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8 // Adjust line spacing as needed
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            textView.attributedText = attributedString
            textView.font = UIFont.systemFont(ofSize: 16)
            textView.textColor = .white
            textView.backgroundColor = .clear
            textView.isEditable = false
            textView.translatesAutoresizingMaskIntoConstraints = false
            return textView
    }()
    private let timestampLabel : UILabel = {
        let label = UILabel()
        label.text = "2023.11.25(토) 23:59"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private func setupLayout() {

      
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(letterview)
        letterview.addSubview(titleLabel)
        letterview.addSubview(bodyTextView)
        letterview.addSubview(timestampLabel)
        letterview.addSubview(authorLabel)
        view.addSubview(backButton)
     
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            letterview.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 133),
            letterview.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -74),
            letterview.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 23),
            letterview.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -23)
        ])
        NSLayoutConstraint.activate([
           titleLabel.topAnchor.constraint(equalTo: timestampLabel.bottomAnchor, constant: 5),
           // Adjust the constant as needed
           titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: letterview.leadingAnchor, constant: 16),
           titleLabel.widthAnchor.constraint(equalToConstant: 200),
           titleLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        NSLayoutConstraint.activate([
            timestampLabel.topAnchor.constraint(equalTo: letterview.topAnchor, constant: 13),
           
            timestampLabel.leadingAnchor.constraint(equalTo: letterview.leadingAnchor, constant: 16),
            timestampLabel.widthAnchor.constraint(equalToConstant: 108),
            timestampLabel.heightAnchor.constraint(equalToConstant: 24),
            
        ])
       NSLayoutConstraint.activate([
           bodyTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
           bodyTextView.leadingAnchor.constraint(equalTo: letterview.leadingAnchor, constant: 15),
           bodyTextView.widthAnchor.constraint(equalToConstant: 299),
           bodyTextView.heightAnchor.constraint(equalToConstant: 455)
       ])
        NSLayoutConstraint.activate([
            authorLabel.bottomAnchor.constraint(equalTo: letterview.bottomAnchor, constant: -25), // Adjust the constant as needed
            authorLabel.leadingAnchor.constraint(equalTo: letterview.leadingAnchor, constant: 248), // Adjust the constant as needed
            authorLabel.trailingAnchor.constraint(equalTo: letterview.trailingAnchor, constant: -24) // Adjust the constant as needed
        ])
        
   
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30), // Adjust as needed
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), // Adjust as needed
            backButton.widthAnchor.constraint(equalToConstant: 44), // Standard icon width
            backButton.heightAnchor.constraint(equalToConstant: 44) // Standard icon height
        ])
    }
    @objc private func backButtonTapped() {
        print("se")
        navigationController?.popViewController(animated: true)
    }
}


