//
//  ForecastViewController.swift
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

protocol ForecastDisplayLogic: class {
    func displayForecast(viewModel: ForecastModels.GetForecast.ViewModel)
}

final class ForecastViewController: BaseViewController, ForecastDisplayLogic {
    var interactor: (ForecastBusinessLogic & ForecastDataStore)?
    var router: (NSObjectProtocol & ForecastRoutingLogic)?
    var forecastList: [ForecastModels.DisplayForecast] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ForecastInteractor()
        let presenter = ForecastPresenter()
        let router = ForecastRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        interactor.weatherWorker = WeatherWorker(store: WeatherRestStore())
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getForecast()
    }
    
    private func setupView() {
        setupTableView()
        title = "Bangkok"
    }
    
    // MARK: IBOutlet
    @IBOutlet var tableView: UITableView!
    
    // MARK: IBAction
    @IBAction func back(_ sender: UIButton) {
        router?.navigateBack()
    }
    
    // MARK: Function
    
    func getForecast() {
        let request = ForecastModels.GetForecast.Request()
        interactor?.getForecast(request: request)
    }
    
    // MARK: Display
    
    func displayForecast(viewModel: ForecastModels.GetForecast.ViewModel) {
        switch viewModel.content {
        case .success(let data):
            forecastList = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            hideIndicator()
        case .userError:
            hideIndicator()
        case .loading:
            showIndicator()
        default:
            break
        }
    }
}

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ForecastTableCell", bundle: nil), forCellReuseIdentifier: "ForecastTableCell")
        tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableCell", for: indexPath) as? ForecastTableCell else { return UITableViewCell() }
        let forecast = forecastList[indexPath.row]
        let date = forecast.date
        let time = forecast.time
        let iconUrl = forecast.iconUrl
        let high = forecast.highTemp
        let low = forecast.lowTemp
        cell.updateUI(date: date, time: time, iconUrl: iconUrl, high: high, low: low)
        return cell
    }
}
