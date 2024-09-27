//
//  HistoriesViewController.swift
//  WaterDr
//
//  Created by ngr on 26/09/24.
//

import Foundation
import UIKit

class HistoriesViewController: UIViewController {
    
    lazy var usvMain: UIStackView = {
        let ctx = UIStackView()
        ctx.alignment = .center
        ctx.axis = .vertical
        return ctx
    }()
    
    lazy var uvHolderDrag: UIView = {
        let ctx = UIView()
        ctx.backgroundColor = .grayLightHolder
        ctx.layer.cornerRadius = 2.5
        return ctx
    }()
    
    let stackCard: HistoriesCardChild = HistoriesCardChild()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupbase()
        setuplayout()
    }
    
    private func setuplayout() {
        self.view.addSubview(usvMain)
        self.usvMain.snp.makeConstraints {(make) -> Void in
            make.top.equalToSuperview().inset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        self.usvMain.spacing = 10
        self.usvMain.addArrangedSubview(uvHolderDrag)
        self.uvHolderDrag.snp.makeConstraints {(make) -> Void in
            make.width.equalTo(ScreenUtils.size().width * 0.35)
            make.height.equalTo(5)
        }
        self.usvMain.addArrangedSubview(stackCard)
        self.stackCard.snp.makeConstraints {(make) -> Void in
            make.width.equalToSuperview()
        }
    }
    
    private func setupbase() {
        self.view.backgroundColor = .white
        roundTopCorners()
    }
    
    private func roundTopCorners() {
        ScreenUtils.roundedCorner(corner: [.topLeft, .topRight], view: self.view, radius: 10)
    }
}

class HistoriesCardChild: UIStackView {
    
    private var data: ModelHistories = ModelHistories(typeOfDrink: TypeOfDrink.water, createdAt: Date.now, amount: 0)
    
    lazy var ulTime: UILabel = {
        let ctx = UILabel()
        ctx.text = "00:00"
        return ctx
    }()
    
    lazy var ulType: UILabel = {
        let ctx = UILabel()
        ctx.text = "Water"
        ctx.textAlignment = .center
        return ctx
    }()
    
    lazy var ulAmount: UILabel = {
        let ctx = UILabel()
        ctx.text = "0 ML"
        return ctx
    }()
    
    lazy var uiiWaterDrop: UIImageView = {
        let ctx = UIImageView(image: UIImage(named: "icWaterDrop"))
        return ctx
    }()
    
    lazy var usvDesc: UIStackView = {
        let ctx = UIStackView()
        ctx.axis = .vertical
        return ctx
    }()
    
    lazy var usvDescDetail: UIStackView = {
        let ctx = UIStackView()
        ctx.axis = .horizontal
        return ctx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuplayout()
    }
    
    private func setuplayout() {
        self.addArrangedSubview(self.ulTime)
        self.addArrangedSubview(self.usvDesc)
        self.addArrangedSubview(self.usvDescDetail)
        self.usvDesc.addArrangedSubview(self.ulType)
        self.usvDesc.addArrangedSubview(self.usvDescDetail)
        self.usvDescDetail.addArrangedSubview(self.ulAmount)
        self.usvDescDetail.addArrangedSubview(self.uiiWaterDrop)
        self.uiiWaterDrop.snp.makeConstraints {(make) -> Void in
            make.width.height.equalTo(ScreenUtils.size().width * 0.075)
        }
        setupData(data: data)
    }
    
    private func setupData(data: ModelHistories) {
        self.ulTime.setStyle(label: DateUtils.dateToString(value: data.createdAt ?? Date.now), fontSize: 14, fontWeight: .bold)
        self.ulType.setStyle(label: data.typeOfDrink?.rawValue ?? "", fontSize: 14, fontWeight: .bold)
        self.ulAmount.setStyle(label: "\(data.amount ?? 0) ML", fontSize: 14, fontWeight: .bold)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
