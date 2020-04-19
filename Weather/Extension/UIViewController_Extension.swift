//
//  UIViewController_Extension.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func setHideKeyboardWhenTap(view: UIView? = nil) -> Void {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        if view == nil {
            self.view.addGestureRecognizer(gesture)
        }
        else{
            view!.addGestureRecognizer(gesture)
        }
    }
    
    @objc private func hideKeyboard() -> Void {
        self.view.endEditing(true)
    }
    
    func showIndicator(_ type: NVActivityIndicatorType = .ballSpinFadeLoader, message: String? = nil) {
        if NVActivityIndicatorPresenter.sharedInstance.isAnimating {
            return
        }
        let data = ActivityData(size: CGSize(width: 40, height: 40), message: nil, messageFont: nil, messageSpacing: nil, type: type, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6), textColor: .white)
        
        NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(data, nil)
    }
    
    func hideIndicator(onComplete:(() -> Void)? = nil) {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating { (view, hide) in
            hide()
            onComplete?()
        }
    }
}
