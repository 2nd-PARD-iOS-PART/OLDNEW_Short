////////
////////  HomeViewController.swift
////////  Short iOS
////////
////////  Created by 박서윤 on 2023/11/25.
////////


import UIKit

class HomeViewController: UIViewController {

    var tableView = UITableView()
    var contentData: [String] = [] // Data to be displayed in the table view

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setBackgroundToSkyImage()
        addWordImage()
    }

    func setupUI() {
        // Configure the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Add button setup with image
        let addButton = UIButton(type: .system)
        if let image = UIImage(named: "addbutton") {
            let originalImage = image.withRenderingMode(.alwaysOriginal)
            addButton.setImage(originalImage, for: .normal)
        }
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    func setBackgroundToSkyImage() {
        if let skyImage = UIImage(named: "homebackground") {
            view.contentMode = .scaleAspectFill
            view.backgroundColor = UIColor(patternImage: skyImage)
            tableView.backgroundColor = .clear // Set table view background clear
        }
    }
    
    func addWordImage() {
        let wordImageView = UIImageView(image: UIImage(named: "word"))
        wordImageView.contentMode = .scaleAspectFit
        wordImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wordImageView)
        
        NSLayoutConstraint.activate([
            wordImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wordImageView.widthAnchor.constraint(equalToConstant: 200), // Adjust width as needed
            wordImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust height as needed
        ])
    }

    @objc func addButtonTapped() {
        let writeVC = WriteViewController()
        writeVC.delegate = self  // Set the delegate
        navigationController?.pushViewController(writeVC, animated: true)
    }
    
    
}

extension HomeViewController: WriteViewControllerDelegate {
    func didSubmitContent(_ content: String) {
        contentData.append(content)
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contentData[indexPath.row]
        return cell
    }
}

