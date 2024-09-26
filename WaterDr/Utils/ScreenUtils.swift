//
//  ScreenUtils.swift
//  WaterDr
//
//  Created by ngr on 25/09/24.
//

import UIKit

class ScreenUtils {
    static func inset() -> (top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        var topInset = 0.0
        var bottomInset = 0.0
        var leftInset = 0.0
        var rightInset = 0.0
        if #available(iOS 15.0, *) {
            // iOS 15 and later
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.keyWindow {
                topInset = window.safeAreaInsets.top
                bottomInset = window.safeAreaInsets.bottom
                rightInset = window.safeAreaInsets.right
                leftInset = window.safeAreaInsets.left
            }
        } else {
            // iOS 14 and earlier
            if let window = UIApplication.shared.windows.first {
                topInset = window.safeAreaInsets.top
                bottomInset = window.safeAreaInsets.bottom
                rightInset = window.safeAreaInsets.right
                leftInset = window.safeAreaInsets.left
            }
        }
        return (top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
    
    static func size() -> (width: CGFloat, height: CGFloat) {
        var sWidth = 0.0
        var sHeight = 0.0
        if #available(iOS 15.0, *) {
            // iOS 15 and later
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.keyWindow {
                sWidth = window.screen.bounds.width
                sHeight = window.screen.bounds.height
            }
        } else {
            // iOS 14 and earlier
            if let window = UIApplication.shared.windows.first {
                sWidth = window.screen.bounds.width
                sHeight = window.screen.bounds.height
            }
        }
        return (width: sWidth, height: sHeight)
    }
}
