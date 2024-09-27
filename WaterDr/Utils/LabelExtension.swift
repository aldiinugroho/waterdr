//
//  LabelExtension.swift
//  WaterDr
//
//  Created by ngr on 27/09/24.
//

import Foundation
import UIKit

extension UILabel {
    func setStyle(label: String, fontSize: CGFloat = 12, fontWeight: UIFont.Weight = .regular) {
        self.attributedText = NSAttributedString(string: label, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        ])
    }
}
