//
//  CityWeatherPresenter.swift
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

protocol CityWeatherPresentationLogic {
    func presentCurrentWeather(response: CityWeatherModels.GetCurrentWeather.Response)
}

final class CityWeatherPresenter: CityWeatherPresentationLogic {
    weak var viewController: CityWeatherDisplayLogic?
    
    func presentCurrentWeather(response: CityWeatherModels.GetCurrentWeather.Response) {
        typealias ViewModel = CityWeatherModels.GetCurrentWeather.ViewModel
        var viewModel: ViewModel
        switch response.result {
        case .success(let data):
            viewModel = ViewModel(content: Content.success(data: data))
        case .failure(let error):
            viewModel = ViewModel(content: Content.userError(error))
        case .loading:
            viewModel = ViewModel(content: Content.loading)
        }
        viewController?.displayCurrentWeather(viewModel: viewModel)
    }
}
