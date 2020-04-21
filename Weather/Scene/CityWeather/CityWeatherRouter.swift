//
//  CityWeatherRouter.swift
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

@objc protocol CityWeatherRoutingLogic {
    func navigateToForecast()
}

final class CityWeatherRouter: NSObject, CityWeatherRoutingLogic {
    weak var viewController: CityWeatherViewController?
    var dataStore: CityWeatherDataStore?
    
    // MARK: Navigation
    
    func navigateToForecast() {
        let destination = StoryboardScene.Forecast.forecastViewController.instantiate()
        destination.interactor?.keyword = unwrapped(dataStore?.keyword, with: "")
        destination.interactor?.degree = unwrapped(dataStore?.degree, with: .celsius)
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
}
