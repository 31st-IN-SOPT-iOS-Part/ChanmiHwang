//
//  UIViewController+.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/13.
//

import UIKit

extension UIViewController {
    func changeRootViewController(_ viewController: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
    
    func changeMainViewController() {
        let mainViewController = UINavigationController(rootViewController: MainViewController())
        mainViewController.isNavigationBarHidden = true
        changeRootViewController(mainViewController)
    }
    
    func getDeviceWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getDeviceHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func convertByWidthRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 375) * getDeviceWidth()
    }
    
    func convertByHeightRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 812) * getDeviceHeight()
    }
}


