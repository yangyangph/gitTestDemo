import Foundation
import UIKit

extension UIDevice {
    /// 顶部安全区高度
    static public func rv_safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0
    }

    /// 底部安全区高度
    static public func rv_safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0
    }

    /// 顶部状态栏高度（包括安全区）
    static public func rv_statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

    /// 导航栏高度
    static public func rv_navigationBarHeight() -> CGFloat {
        return 44.0
    }

    /// 状态栏+导航栏的高度
    static public func rv_navigationFullHeight() -> CGFloat {
        return UIDevice.rv_statusBarHeight() + UIDevice.rv_navigationBarHeight()
    }

    /// 底部导航栏高度
    static public func rv_tabBarHeight() -> CGFloat {
        return 49.0
    }

    /// 底部导航栏高度（包括安全区）
    static public func rv_tabBarFullHeight() -> CGFloat {
        return UIDevice.rv_tabBarHeight() + UIDevice.rv_safeDistanceBottom()
    }

    /// 屏幕宽度
    static public func rv_screenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }

    /// 屏幕高度
    static public func rv_screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
