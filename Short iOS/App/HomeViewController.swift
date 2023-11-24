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
    }

    func setupCollectionView() {
        // 레이아웃 설정
        layout.minimumInteritemSpacing = 10 // 아이템 간의 최소 간격
        layout.minimumLineSpacing = 10 // 줄 간의 최소 간격
        
        // UICollectionView 초기화 및 설정
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        
        // 뷰에 추가
        view.addSubview(collectionView)
    }

    // 필수 DataSource 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // 예시 아이템 개수
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue // 예시 배경색
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
}

