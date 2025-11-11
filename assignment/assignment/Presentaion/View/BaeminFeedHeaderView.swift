//
//  BaeminFeedHeaderView.swift
//  assignment
//
//  Created by 신혜연 on 11/11/25.
//

import UIKit

import SnapKit
import Then

final class BaeminFeedHeaderView: UIView {

    // MARK: - UI Components
    
    private let locationButton = UIButton(type: .system).then {
        $0.configuration = .plain()
        $0.configuration?.title = "우리집"
        $0.configuration?.attributedTitle?.font = .head_b_16
        $0.configuration?.image = .polygon
        $0.configuration?.imagePlacement = .trailing
        $0.configuration?.imagePadding = 3
        $0.configuration?.baseForegroundColor = .baeminBlack
        $0.configuration?.contentInsets = .zero
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 12
        $0.alignment = .center
    }
    
    private let benefitButton = UIButton(type: .custom).then {
        $0.setImage(.icon1, for: .normal)
    }
    
    private let notiButton = UIButton(type: .custom).then {
        $0.setImage(.icon2, for: .normal)
    }
    
    private let basketButton = UIButton(type: .custom).then {
        $0.setImage(.icon3, for: .normal)
    }
    
    private let textField = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "찾아라! 맛있는 음식과 맛집"
        $0.font = .body_r_14
        $0.layer.cornerRadius = 20
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.baeminBlack.cgColor
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 0))
        $0.leftView = leftPadding
        $0.leftViewMode = .always
        
        let iconImage = UIImage(resource: .searchIcon)
        let iconView = UIImageView(image: iconImage)
        iconView.tintColor = .baeminBlack
        
        let iconContainer = UIView()
        let padding = 17
        let iconSize = 24
        
        iconContainer.frame = CGRect(x: 0, y: 0, width: iconSize + padding, height: iconSize)
        
        iconContainer.addSubview(iconView)
        $0.rightView = iconContainer
        $0.rightViewMode = .always
    }
    
    private let imageView = UIImageView().then {
        $0.image = .bMartImg
    }
    
    private let specialPriceButton = UIButton(type: .system).then {
        $0.configuration = .plain()
        $0.configuration?.title = "전상품 쿠폰팩 + 60%특가"
        $0.configuration?.attributedTitle?.font = .head_b_16
        $0.configuration?.image = .chevronRight
        $0.configuration?.imagePlacement = .trailing
        $0.configuration?.imagePadding = 2
        $0.configuration?.baseForegroundColor = .baeminBlack
        $0.configuration?.contentInsets = .zero
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

    // MARK: - Setup Methods
    
    private func setUI() {
        self.addSubviews(locationButton, stackView, textField, imageView, specialPriceButton)
        stackView.addArrangedSubviews(benefitButton, notiButton, basketButton)
    }
    
    private func setLayout() {
        locationButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.leading.equalToSuperview().inset(20)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(58)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        textField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(locationButton.snp.bottom).offset(12)
            $0.height.equalTo(40)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(textField.snp.bottom).offset(24)
            $0.leading.equalTo(textField)
        }
        
        specialPriceButton.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.leading.equalTo(textField)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}
