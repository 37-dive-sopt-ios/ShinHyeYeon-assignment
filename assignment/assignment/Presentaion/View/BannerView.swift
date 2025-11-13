//
//  BannerView.swift
//  assignment
//
//  Created by 신혜연 on 11/12/25.
//

import UIKit

import SnapKit
import Then

final class BannerView: UIView {
    
    // MARK: - Properties
    
    private let bannerImages: [UIImage?] = [
        UIImage(resource: .banner1),
        UIImage(resource: .banner2),
        UIImage(resource: .banner3)
    ]
    
    // MARK: - UI Components

    private lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    
    private func setStyle() {
        backgroundColor = .white
    }
    
    private func setUI() {
        addSubview(bannerCollectionView)
    }
    
    private func setLayout() {
        bannerCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(114)
            $0.bottom.equalToSuperview()
        }
    }
}

extension BannerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BannerCell.identifier,
            for: indexPath
        ) as? BannerCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: bannerImages[indexPath.item])
        return cell
    }
}

extension BannerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

#Preview {
    BannerView()
}
