//
//  BannerCell.swift
//  assignment
//
//  Created by 신혜연 on 11/12/25.
//

import UIKit

import SnapKit
import Then

final class BannerCell: UICollectionViewCell {
    
    static let identifier = "BannerCell"
    
    private let bannerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(bannerImageView)
    }
    
    private func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    public func configure(with image: UIImage?) {
        bannerImageView.image = image
    }
}
