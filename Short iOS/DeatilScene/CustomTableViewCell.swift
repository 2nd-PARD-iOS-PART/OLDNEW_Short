import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let senderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(senderLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with letter: GetLetterData) {
        titleLabel.text = letter.title
        contentLabel.text = letter.content
        senderLabel.text = letter.sender
        // Here you can also set the image using letter.imagePath
    }
    
    private func applyConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        senderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add your constraints here
        // For example:
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            senderLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 5),
            senderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            senderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            senderLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    
}
