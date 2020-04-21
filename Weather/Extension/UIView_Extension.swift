//
//  UIView_Extension.swift
//  Weather
//
//  Created by Anuwat Sittichak on 21/4/2563 BE.
//

import UIKit

extension UIView {

    func roundCornerView(rad: CGFloat) {
        self.layer.cornerRadius = rad
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
