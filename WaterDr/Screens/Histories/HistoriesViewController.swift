//
//  HistoriesViewController.swift
//  WaterDr
//
//  Created by ngr on 26/09/24.
//

import Foundation
import UIKit

class HistoriesViewController: UIViewController {
    var data: [String] = ["sample1","sample2"]
    
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
    
    lazy var utvCardHistories: UITableView = {
        let ctx = UITableView()
        ctx.separatorStyle = UITableViewCell.SeparatorStyle.none
        return ctx
    }()

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
        registerUtvCardHistories()
    }
    
    private func registerUtvCardHistories() {
        self.usvMain.addArrangedSubview(utvCardHistories)
        self.utvCardHistories.snp.makeConstraints {(make) -> Void in
            make.width.equalToSuperview()
            make.height.equalTo(ScreenUtils.size().height * 0.65)
        }
        utvCardHistories.rowHeight = UITableView.automaticDimension
        utvCardHistories.register(HistoriesCardChildCell.self, forCellReuseIdentifier: HistoriesCardChildCell.reuseableId)
        utvCardHistories.delegate = self
        utvCardHistories.dataSource = self
    }
    
    func updateTableSize(size: CGFloat) {
        print(size)
    }
    
    private func setupbase() {
        self.view.backgroundColor = .white
        roundTopCorners()
    }
    
    private func roundTopCorners() {
        ScreenUtils.roundedCorner(corner: [.topLeft, .topRight], view: self.view, radius: 10)
    }
}

extension HistoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HistoriesCardChildCell = tableView.dequeueReusableCell(withIdentifier: HistoriesCardChildCell.reuseableId, for: indexPath) as! HistoriesCardChildCell
        cell.selectionStyle = .none
        if indexPath.row == data.count - 1 {
            cell.setupCell(separate: false)
        } else {
            cell.setupCell(separate: true)
        }
        return cell
    }
}

class HistoriesCardChildCell: UITableViewCell {
    static let reuseableId: String = "HistoriesCardChildCell"
    
    let childComponent: HistoriesCardChild = HistoriesCardChild()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(childComponent)        
        childComponent.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupCell(separate: Bool) {
        let data: ModelHistories = ModelHistories(typeOfDrink: TypeOfDrink.water, createdAt: Date.now, amount: 0)
        childComponent.setupData(data: data, separate: separate)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
