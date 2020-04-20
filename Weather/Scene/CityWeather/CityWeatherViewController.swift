//
//  CityWeatherViewController.swift
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

protocol CityWeatherDisplayLogic: class {
    func displayCurrentWeather(viewModel: CityWeatherModels.GetCurrentWeather.ViewModel)
}

final class CityWeatherViewController: BaseViewController, CityWeatherDisplayLogic {
    var interactor: (CityWeatherBusinessLogic & CityWeatherDataStore)?
    var router: (NSObjectProtocol & CityWeatherRoutingLogic)?
    
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
        let interactor = CityWeatherInteractor()
        let presenter = CityWeatherPresenter()
        let router = CityWeatherRouter()
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
        setupUI()
    }
    
    private func setupUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(CityWeatherViewController.keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CityWeatherViewController.keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        forecastButton.isHidden = true
        detailView.isHidden = true
        noResultView.isHidden = true
        cityNameTextField.delegate = self
    }
    
    @objc private func keyboardWillAppear(notification: NSNotification) {
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc private func keyboardWillDisappear(notification: NSNotification) {
        let contentInset: UIEdgeInsets = .zero
        scrollView.contentInset = contentInset
    }
    
    // MARK: IBOutlet
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var forecastButton: UIButton!
    @IBOutlet var cityNameTextField: UITextField!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var detailView: UIView!
    @IBOutlet var noResultView: UIView!
    
    // MARK: IBAction
    @IBAction func viewForecast(_ sender: UIButton) {
        router?.navigateToForecast()
    }
    
    // MARK: Function
    
    private func getCurrentWeather(cityName: String) {
        let request = CityWeatherModels.GetCurrentWeather.Request(cityName: cityName)
        interactor?.getCurrentWeather(request: request)
    }
    
    // MARK: Display
    
    func displayCurrentWeather(viewModel: CityWeatherModels.GetCurrentWeather.ViewModel) {
        switch viewModel.content {
        case .success(let data):
            cityNameLabel.text = data.name
            descriptionLabel.text = data.description
            weatherImageView.setImage(with: data.imageUrl)
            tempLabel.text = data.temp
            humidityLabel.text = data.humidity
            forecastButton.isHidden = false
            detailView.isHidden = false
            noResultView.isHidden = true
            hideIndicator()
        case .userError:
            forecastButton.isHidden = true
            detailView.isHidden = true
            noResultView.isHidden = false
            hideIndicator()
        case .loading:
            showIndicator()
        default:
            break
        }
    }
}

extension CityWeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = unwrapped(textField.text, with: "")
        view.endEditing(true)
        getCurrentWeather(cityName: text)
        return true
    }
}
