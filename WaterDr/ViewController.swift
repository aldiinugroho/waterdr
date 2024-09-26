//
//  ViewController.swift
//  WaterDr
//
//  Created by ngr on 25/09/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let centerAlignt: NSParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
    }()
    
    private lazy var tvTargetML: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "0 ML", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.blueLightWord,
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var tvProgressML: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "0% dari 0 ML", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var svTargetnProg: UIStackView = {
        let ctx = UIStackView()
        ctx.axis = .vertical
        return ctx
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBase()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(svTargetnProg)
        svTargetnProg.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(ScreenUtils.topInset())
            make.width.equalToSuperview()
        }
        
        svTargetnProg.addArrangedSubview(self.tvTargetML)
        svTargetnProg.addArrangedSubview(self.tvProgressML)
    }
    
    private func setupBase() {
        self.view.backgroundColor = UIColor.blueLight
    }
}
