//
//  CategoryCell.swift
//  assignment
//
//  Created by 신혜연 on 11/11/25.
//

import UIKit

import SnapKit
import Then

class CategoryCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "FoodCategoryCell"
  
    // MARK: - UI Components
    
    private let foodImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .baeminBackgroundWhite
        $0.clipsToBounds = true
    }
    
    private let categoryLabel = UILabel().then {
        $0.font = .body_r_14
        $0.textColor = .baeminBlack
        $0.text = "한그릇"
    }
    
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
        addSubviews(foodImageView, categoryLabel)
    }
    
    private func setLayout() {
        foodImageView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.size.equalTo(58)
        }
        
        categoryLabel.snp.makeConstraints{
            $0.top.equalTo(foodImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
}

extension CategoryCell {
    public func configure(with categoryName: String, image: UIImage?) {
        categoryLabel.text = categoryName
        foodImageView.image = image
    }
}
