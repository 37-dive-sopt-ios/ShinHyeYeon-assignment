//
//  WelcomeViewController.swift
//  assignment
//
//  Created by 신혜연 on 10/31/25.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var id: String?
    
    // MARK: - UI Components
    
    private let backButton = UIButton(type: .system).then {
        $0.setImage(UIImage(resource: .arrowLeft), for: .normal)
        $0.tintColor = . baeminBlack
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "육회초밥은 너무 맛있뎌"
        $0.textColor = .baeminBlack
        $0.font = UIFont.title_sb_18
    }
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(resource: .baemin)
        $0.contentMode = .scaleAspectFill
    }
    
    private let welcomeLabel = UILabel().then {
        $0.text = "육회초밥은 너무 맛있뎌"
        $0.textColor = .baeminBlack
        $0.font = UIFont.head_b_24
    }
    
    private let idLabel = UILabel().then {
        $0.text = "oo님 반가워요!"
        $0.textColor = .baeminBlack
        $0.font = UIFont.title_sb_18
    }
    
    private let loginButton = UIButton(type: .system).then {
        $0.setTitle("뒤로가기", for: .normal)
        $0.backgroundColor = .baeminMint500
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 4
        $0.titleLabel?.font = .head_b_18
        $0.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    private func setUI() {
        view.addSubviews(backButton, titleLabel,
                         imageView, welcomeLabel, idLabel,
                         loginButton)
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(52)
            $0.leading.equalToSuperview().inset(8)
            $0.size.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(60)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
            $0.height.equalTo(211)
            $0.horizontalEdges.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(24)
        }
        
        idLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(16)
        }
        
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(48)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }
    
    private func setWelcomeText() {
        if let id = self.id, !id.isEmpty {
            idLabel.text = "\(id)님 반가워요!"
        }
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

#Preview {
    WelcomeViewController()
}
