//
//  ScreenUtils.swift
//  WaterDr
//
//  Created by ngr on 25/09/24.
//

import UIKit

class ScreenUtils {
    static func topInset() -> CGFloat {
        if #available(iOS 15.0, *) {
            // iOS 15 and later
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.keyWindow {
                let topSafeAreaHeight = window.safeAreaInsets.top
                return topSafeAreaHeight
            }
        } else {
            // iOS 14 and earlier
            if let window = UIApplication.shared.windows.first {
                let topSafeAreaHeight = window.safeAreaInsets.top
                return topSafeAreaHeight
            }
        }
        return 0.0
    }
}
