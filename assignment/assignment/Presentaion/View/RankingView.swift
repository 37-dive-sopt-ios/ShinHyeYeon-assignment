//
//  RankingView.swift
//  assignment
//
//  Created by 신혜연 on 11/12/25.
//

import UIKit

import SnapKit
import Then

final class RankingView: UIView {
    
    // MARK: - Properties
    
    private let rankingLabel = UILabel().then {
        $0.font = .title_sb_18
        $0.textColor = .white
        $0.text = "우리 동네 한그릇 인기 랭킹"
    }
    
    private let infoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(resource: .infoIcon).withRenderingMode(.alwaysTemplate)
        $0.tintColor = .white
    }
    
    private let wholeButton = UIButton(type: .system).then {
        var config = UIButton.Configuration.plain()
        
        var titleAttr = AttributedString("전체보기")
        titleAttr.font = .head_b_16
        config.attributedTitle = titleAttr
        
        config.image = UIImage(resource: .chevronRight).withRenderingMode(.alwaysTemplate)
        config.imagePlacement = .trailing
        config.imagePadding = 4
        config.baseForegroundColor = .white
        config.contentInsets = .zero
        
        $0.configuration = config
    }
    
    private lazy var rankingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.itemSize = CGSize(width: 145, height: 270)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        collectionView.register(RankingCell.self, forCellWithReuseIdentifier: RankingCell.identifier)
        
        collectionView.dataSource = self
        
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
        backgroundColor = .lightGray // TODO: 그라데이션 배경 교체
    }
    
    private func setUI() {
        addSubviews(rankingLabel, infoImageView, wholeButton, rankingCollectionView)
    }
    
    private func setLayout() {
        rankingLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        
        infoImageView.snp.makeConstraints{
            $0.centerY.equalTo(rankingLabel)
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(3)
            $0.size.equalTo(16)
        }
        
        wholeButton.snp.makeConstraints {
            $0.centerY.equalTo(rankingLabel)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        rankingCollectionView.snp.makeConstraints{
            $0.top.equalTo(rankingLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(270)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}

extension RankingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RankingCell.identifier,
            for: indexPath
        ) as? RankingCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

#Preview {
    RankingView()
}
