//
//  UIImageView_Extension.swift
//  Weather
//
//  Created by Anuwat Sittichak on 21/4/2563 BE.
//

import Kingfisher
import UIKit

extension UIImageView {
    
    func setImage(with: URL?) -> Void {
        self.kf.setImage(with: with)
    }
}
