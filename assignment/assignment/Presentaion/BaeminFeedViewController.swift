//
//  BaeminFeedViewController.swift
//  assignment
//
//  Created by 신혜연 on 11/11/25.
//

import UIKit

import SnapKit
import Then

final class BaeminFeedViewController: UIViewController {
    
    // MARK: - UI Components
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
    }

    // MARK: - Setup Methods
    
    private func setStyle() {
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
    }
    
    private func setLayout() {
    }
}
