//
//  ViewController.swift
//  WaterDr
//
//  Created by ngr on 25/09/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let centerAlignt: NSParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
    }()
    
    private lazy var ulTargetML: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "0 ML", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor.blueLightWord,
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var ulProgressML: UILabel = {
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
        ctx.alignment = .center
        ctx.distribution = .equalSpacing
        ctx.axis = .vertical
        return ctx
    }()
    
    private lazy var svInfoBar: UIStackView = {
        let ctx = UIStackView()
        ctx.alignment = .center
        ctx.distribution = .equalSpacing
        ctx.axis = .vertical
        return ctx
    }()
    
    private lazy var uvHolderIndicator: UIView = {
        let ctx = UIView()
        ctx.backgroundColor = .softBrown
        ctx.layer.borderColor = UIColor.white.cgColor
        ctx.layer.borderWidth = 5
        ctx.layer.cornerRadius = 200 / 2
        ctx.layer.masksToBounds = true
        return ctx
    }()
    
    private lazy var ulEmoji: UILabel = {
        let ctx = UILabel()
        ctx.attributedText = NSAttributedString(string: "😌", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 100, weight: .bold),
            NSAttributedString.Key.paragraphStyle: centerAlignt
        ])
        return ctx
    }()
    
    private lazy var uivHistory: UIImageView = {
        let ctx = UIImageView()
        ctx.image = UIImage(named: "icHistory")
        return ctx
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBase()
        setupLayout()
    }
    
    private func setupLayout() {
        self.view.addSubview(svInfoBar)
        svInfoBar.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().inset(ScreenUtils.inset().top)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        svInfoBar.addArrangedSubview(self.svTargetnProg)
        svTargetnProg.addArrangedSubview(self.ulTargetML)
        svTargetnProg.addArrangedSubview(self.ulProgressML)
        svInfoBar.addArrangedSubview(self.uvHolderIndicator)
        self.uvHolderIndicator.addSubview(self.ulEmoji)
        svInfoBar.addArrangedSubview(self.uivHistory)
        self.ulTargetML.snp.makeConstraints{(make) -> Void in
            make.width.equalToSuperview()
        }
        self.ulProgressML.snp.makeConstraints{(make) -> Void in
            make.width.equalToSuperview()
        }
        self.uvHolderIndicator.snp.makeConstraints{(make) -> Void in
            make.width.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
        self.ulEmoji.snp.makeConstraints {(make) -> Void in
            make.center.equalToSuperview()
        }
        self.uivHistory.snp.makeConstraints {(make) -> Void in
            make.width.height.equalTo(25)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupBase() {
        self.view.backgroundColor = UIColor.blueLight
    }
}
