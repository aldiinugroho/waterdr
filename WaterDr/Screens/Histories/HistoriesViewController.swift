//
//  HistoriesViewController.swift
//  WaterDr
//
//  Created by ngr on 26/09/24.
//

import Foundation
import UIKit

class HistoriesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        roundTopCorners()
    }
    
    private func roundTopCorners() {
        ScreenUtils.roundedCorner(corner: [.topLeft, .topRight], view: self.view, radius: 10)
    }
}
