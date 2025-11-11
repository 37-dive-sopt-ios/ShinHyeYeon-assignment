//
//  MartView.swift
//  assignment
//
//  Created by 신혜연 on 11/11/25.
//

import UIKit

import SnapKit
import Then

final class MartView: UIView {
    
    // MARK: - Properties
    
    let martCategories = ["B마트", "CU", "이마트슈퍼", "홈플러스", "GS25",
                          "이마트", "롯데마트", "코스트코"]
    
    private lazy var cellHeight: CGFloat = {
        let labelFont = UIFont.body_r_14
        let labelHeight = "A".size(withAttributes: [.font: labelFont]).height
        return 58 + 6 + labelHeight
    }()
    
    // MARK: - UI Components
    
    private lazy var martCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 11, left: 16, bottom: 11, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FoodCategoryCell.self, forCellWithReuseIdentifier: FoodCategoryCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    
    private func setUI() {
        addSubview(martCollectionView)
    }
    
    private func setLayout() {
        martCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(cellHeight + 22)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MartView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return martCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FoodCategoryCell.identifier,
            for: indexPath
        ) as? FoodCategoryCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: martCategories[indexPath.item])
        return cell
    }
}

extension MartView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 58
        return CGSize(width: cellWidth, height: self.cellHeight)
    }
}

#Preview {
    MartView()
}
