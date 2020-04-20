//
//  ForecastRouter.swift
//  Weather
//
//  Created by Anuwat Sittichak on 18/4/2563 BE.
//  Copyright (c) 2563 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ForecastRoutingLogic {
    func navigateBack()
}

final class ForecastRouter: NSObject, ForecastRoutingLogic {
    weak var viewController: ForecastViewController?
    var dataStore: ForecastDataStore?
    
    // MARK: Navigation
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
