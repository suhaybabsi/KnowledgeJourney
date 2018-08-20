//
//  UIKit+Extensions.swift
//  KnowledgeJourney
//
//  Created by Suhayb Al-Absi on 8/20/18.
//  Copyright © 2018 Suhayb Al-Absi. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}


extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}


func showMessage(_ message:String) -> Void {
    
    
    let alert = UIAlertController(title: "رحلة المعرفة", message: message, preferredStyle: .alert)
    
    
    alert.addAction( UIAlertAction(title: "حسناً", style: .cancel, handler: nil) )
    
    UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
}
