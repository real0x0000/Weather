//
//  ForecastPresenter.swift
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

protocol ForecastPresentationLogic {
    func presentForecast(response: ForecastModels.GetForecast.Response)
}

final class ForecastPresenter: ForecastPresentationLogic {
    weak var viewController: ForecastDisplayLogic?
    
    func presentForecast(response: ForecastModels.GetForecast.Response) {
        typealias ViewModel = ForecastModels.GetForecast.ViewModel
        var viewModel: ViewModel
        switch response.result {
        case .success(let data):
            let (name, list) = data
            let forecastList: [ForecastModels.DisplayForecast] = list.map {
                let datetime = unwrapped(DateFormatter.dateFrom(string: $0.dt_txt, format: "yyyy-MM-dd HH:mm:ss"), with: Date())
                let dateStr = DateFormatter.stringFrom(date: datetime, format: "E")
                let timeStr = DateFormatter.stringFrom(date: datetime, format: "HH:mm")
                let iconUrl = URL(string: APIClient.share.getImagePath(icon: unwrapped($0.weather.first?.icon, with: "")))
                let highTemp = $0.main.temp_max
                let lowTemp = $0.main.temp_min
                return ForecastModels.DisplayForecast(date: dateStr, time: timeStr, iconUrl: iconUrl, highTemp: highTemp, lowTemp: lowTemp)
            }
            viewModel = ViewModel(content: Content.success(data: (name, forecastList)))
        case .failure(let error):
            viewModel = ViewModel(content: Content.userError(error))
        case .loading:
            viewModel = ViewModel(content: Content.loading)
        }
        viewController?.displayForecast(viewModel: viewModel)
    }
}
