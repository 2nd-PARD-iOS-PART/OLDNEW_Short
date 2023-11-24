//////
//////  HomeViewController.swift
//////  Short iOS
//////
//////  Created by 박서윤 on 2023/11/25.
//////
////
////import UIKit
////
////class HomeViewController: UIViewController {
////    
////    var tableView = UITableView()
////    var contentData: [String] = [] // 이 데이터는 나중에 테이블 뷰에 표시될 내용입니다.
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        
////        // 화면에 보일 제목 레이블
////        let titleLabel = UILabel()
////        titleLabel.text = "Home"
////        titleLabel.textAlignment = .center
////        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
////        titleLabel.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(titleLabel)
////        
////        // 제목 레이블의 제약 조건 설정
////        NSLayoutConstraint.activate([
////            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
////            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
////        ])
////        
////        // 우측 상단에 추가 버튼
////        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
////        navigationItem.rightBarButtonItem = addButton
////        
////        // 테이블 뷰 설정
////        tableView.delegate = self
////        tableView.dataSource = self
////        tableView.translatesAutoresizingMaskIntoConstraints = false
////        view.addSubview(tableView)
////        
////        // 테이블 뷰의 제약 조건 설정
////        NSLayoutConstraint.activate([
////            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
////            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
////            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
////        ])
////    }
////    
////    @objc func addButtonTapped() {
////        // 추가 버튼이 눌렸을 때 동작할 내용을 추가합니다.
////        // 예를 들어, contentData에 새로운 데이터를 추가하고 테이블 뷰를 새로고침할 수 있습니다.
////        contentData.append("New Content")
////        tableView.reloadData()
////    }
////}
////
////extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return contentData.count
////    }
////    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
////        cell.textLabel?.text = contentData[indexPath.row]
////        return cell
////    }
////}
////
////
////
////
////
////
////
//
//
//
//
//// HomeViewController.swift
//import UIKit
//
//class HomeViewController: UIViewController {
//
//    var tableView = UITableView()
//    var contentData: [String] = [] // 테이블 뷰에 표시될 내용
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Home"
//        setupUI()
//    }
//
//    func setupUI() {
//        // 화면 요소들을 설정하는 부분
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
//        navigationItem.rightBarButtonItem = addButton
//
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tableView)
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//
//    @objc func addButtonTapped() {
//        let writeVC = WriteViewController()
//        writeVC.delegate = self
//        navigationController?.pushViewController(writeVC, animated: true)
//    }
//}
//
//extension HomeViewController: WriteViewControllerDelegate {
//    func didSubmitContent(_ content: String) {
//        contentData.append(content)
//        tableView.reloadData()
//    }
//}
//
//extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return contentData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = contentData[indexPath.row]
//        return cell
//    }
//}







import UIKit

class HomeViewController: UIViewController {

    var tableView = UITableView()
    var contentData: [String] = [] // 테이블 뷰에 표시될 내용

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupUI()
    }

    func setupUI() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton

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
    }

    @objc func addButtonTapped() {
        let writeVC = WriteViewController()
        writeVC.delegate = self
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
