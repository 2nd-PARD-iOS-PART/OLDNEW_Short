//
//  HomeCollectionViewCell.swift
//  Short iOS
//
//  Created by 이신원 on 2023/11/25.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        //label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(topLabel)
        contentView.addSubview(bottomLabel)
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Adjust your label frames here based on the cell's frame.
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5 ),
            topLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            bottomLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            bottomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        
        //topLabel.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 40)
        //bottomLabel.frame = CGRect(x: 0, y: contentView.frame.size.height - 40, width: contentView.frame.size.width, height: 40)
    }
    
    public func configure(image: UIImage?, topText: String, bottomText: String) {
        imageView.image = image
        topLabel.text = topText
        bottomLabel.text = bottomText
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        topLabel.text = nil
        bottomLabel.text = nil
    }
    
}
