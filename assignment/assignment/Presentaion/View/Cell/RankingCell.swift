//
//  RankingCell.swift
//  assignment
//
//  Created by 신혜연 on 11/12/25.
//

import UIKit

import SnapKit
import Then

class RankingCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "RankingCell"
    
    // MARK: - UI Components
    
    private let mainImageView = UIImageView().then {
        $0.backgroundColor = .baeminGray200
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.image = .food0
    }
    
    private let storeNameLabel = UILabel().then {
        $0.text = "백억보쌈제육..."
        $0.font = .body_r_12
        $0.textColor = .baeminGray600
    }
    
    private let starImageView = UIImageView().then {
        $0.image = UIImage(resource: .star)
        $0.contentMode = .scaleAspectFit
    }
    
    private let ratingLabel = UILabel().then {
        $0.text = "5.0"
        $0.font = .body_r_12
        $0.textColor = .baeminGray600
    }
    
    private let reviewCountLabel = UILabel().then {
        $0.text = "(1,973)"
        $0.font = .body_r_12
        $0.textColor = .baeminGray600
    }
    
    private let itemNameLabel = UILabel().then {
        $0.text = "[든든한 한끼] 보쌈 막국수"
        $0.font = .body_r_14
        $0.textColor = .baeminBlack
        $0.numberOfLines = 1
    }
    
    private let discountLabel = UILabel().then {
        $0.text = "25%"
        $0.font = .head_b_14
        $0.textColor = .baeminRed
    }

    private let priceLabel = UILabel().then {
        $0.text = "12,000원"
        $0.font = .head_b_14
        $0.textColor = .baeminBlack
    }
    
    private let originalPriceLabel = UILabel().then {
        let text = "16,000원"
        let attributeString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
        $0.attributedText = attributeString
        $0.font = .body_r_12
        $0.textColor = .baeminGray600
    }
    
    private let minOrderLabel = UILabel().then {
        $0.text = "최소주문금액 없음"
        $0.font = .head_b_14
        $0.textColor = .baeminPurple
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
        addSubviews(mainImageView, storeNameLabel, starImageView,
                    ratingLabel, reviewCountLabel, itemNameLabel,
                    discountLabel, priceLabel, originalPriceLabel,
                    minOrderLabel)
    }
    
    private func setLayout() {
        mainImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.size.equalTo(145)
        }
        
        storeNameLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(9)
            $0.leading.equalTo(mainImageView)
        }
        
        starImageView.snp.makeConstraints {
            $0.leading.equalTo(storeNameLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(storeNameLabel)
            $0.size.equalTo(10)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.leading.equalTo(starImageView.snp.trailing).offset(2)
            $0.centerY.equalTo(storeNameLabel)
        }
        
        reviewCountLabel.snp.makeConstraints {
            $0.leading.equalTo(ratingLabel.snp.trailing).offset(2)
            $0.centerY.equalTo(storeNameLabel)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        
        itemNameLabel.snp.makeConstraints {
            $0.top.equalTo(storeNameLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview()
        }
        
        discountLabel.snp.makeConstraints {
            $0.top.equalTo(itemNameLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(discountLabel.snp.trailing).offset(6)
            $0.centerY.equalTo(discountLabel)
        }
        
        originalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(discountLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        minOrderLabel.snp.makeConstraints {
            $0.top.equalTo(originalPriceLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
}

#Preview {
    RankingCell()
}
