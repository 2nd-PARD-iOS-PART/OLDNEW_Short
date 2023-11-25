//
//  Cell.swift
//  Short iOS
//
//  Created by 박서윤 on 2023/11/25.
//


import UIKit

class CustomTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CustomCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "ejifjweifjweiofjewip"
        label.textColor = .red
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Customize cell UI elements here
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16), // Adjust top space
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16) // Adjust bottom space
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
