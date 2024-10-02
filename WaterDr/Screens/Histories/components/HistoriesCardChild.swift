//
//  HistoriesCardChild.swift
//  WaterDr
//
//  Created by ngr on 27/09/24.
//

import Foundation
import UIKit


class HistoriesCardChild: UIStackView {
    
    private var data: ModelHistories = ModelHistories(typeOfDrink: TypeOfDrink.water, createdAt: Date.now, amount: 0)
    
    lazy var usvMain: UIStackView = {
        let ctx = UIStackView()
        ctx.axis = .horizontal
        return ctx
    }()
    
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
    
    lazy var uvSeparator: UIView = {
        let ctx = UIView()
        return ctx
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        setuplayout()
    }
    
    private func setuplayout() {
        self.addArrangedSubview(self.usvMain)
        self.usvMain.addArrangedSubview(self.ulTime)
        self.usvMain.addArrangedSubview(self.usvDesc)
        self.usvMain.addArrangedSubview(self.usvDescDetail)
        self.usvDesc.addArrangedSubview(self.ulType)
        self.usvDesc.addArrangedSubview(self.usvDescDetail)
        self.usvDescDetail.addArrangedSubview(self.ulAmount)
        self.usvDescDetail.addArrangedSubview(self.uiiWaterDrop)
        self.uiiWaterDrop.snp.makeConstraints {(make) -> Void in
            make.width.height.equalTo(ScreenUtils.size().width * 0.075)
        }
        setupData(data: data, separate: false)
    }
    
    func setupData(data: ModelHistories, separate: Bool) {
        self.ulTime.setStyle(label: DateUtils.dateToString(value: data.createdAt ?? Date.now), fontSize: 14, fontWeight: .bold)
        self.ulType.setStyle(label: data.typeOfDrink?.rawValue ?? "", fontSize: 14, fontWeight: .bold)
        self.ulAmount.setStyle(label: "\(data.amount ?? 0) ML", fontSize: 14, fontWeight: .bold)
        if separate {
            setSeparator()
        }
    }
    
    private func setSeparator() {
        self.addArrangedSubview(self.uvSeparator)
        self.uvSeparator.snp.makeConstraints {(make) -> Void in
            make.width.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
