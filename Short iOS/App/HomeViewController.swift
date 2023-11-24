//
//  HomeViewController.swift
//  Short iOS
//
//  Created by 이신원 on 2023/11/25.
//

import UIKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    let navigation = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setNavigationBar()
    }
    
    func setNavigationBar(){
        // 네비게이션 타이틀 설정
        navigationItem.title = "0205"

        // 왼쪽 버튼(앱 아이콘) 설정
        let appIcon = UIImage(named: "appIcon")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: appIcon, style: .plain, target: self, action: #selector(appIconTapped))

        // 오른쪽 버튼(+) 설정
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func appIconTapped() {
        // 앱 아이콘 탭 시 수행할 동작
    }

    @objc func addButtonTapped() {
        // '+' 버튼 탭 시 수행할 동작
    }
    

    func setupCollectionView() {
        // 레이아웃 설정
        layout.minimumInteritemSpacing = 1 // 아이템 간의 최소 간격
        layout.minimumLineSpacing = 1 // 줄 간의 최소 간격
        
        // UICollectionView 초기화 및 설정
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        
        // 뷰에 추가
        view.addSubview(collectionView)
    }

    // 필수 DataSource 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // 예시 아이템 개수
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .blue // 예시 배경색
//        return cell
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            // 이미지와 텍스트를 설정하는 로직이 들어갑니다.
            // 예를 들어, 아래와 같이 설정할 수 있습니다:
            cell.configure(image: UIImage(named: "testImage"), topText: "상단 텍스트", bottomText: "하단 텍스트")
            return cell
    }

    // DelegateFlowLayout 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 각 셀의 가로 길이를 계산합니다.
        let paddingSpace = layout.minimumInteritemSpacing * (3 - 1) // 3개의 셀 사이의 총 간격
        let availableWidth = view.frame.width - paddingSpace // 사용 가능한 전체 너비
        let widthPerItem = availableWidth / 3 // 각 셀의 너비
        
        return CGSize(width: widthPerItem, height: widthPerItem) // 정사각형 형태의 셀 크기
    }
    
    //cell 클릭했을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hello")
    }
}

