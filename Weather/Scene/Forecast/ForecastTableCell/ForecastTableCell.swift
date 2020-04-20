//
//  ForecastTableCell.swift
//  Weather
//
//  Created by Anuwat Sittichak on 21/4/2563 BE.
//

import UIKit

final class ForecastTableCell: UITableViewCell {
    
    @IBOutlet weak var forecastView: ForecastView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(date: String, time: String, iconUrl: URL?, high: Double, low: Double) {
        forecastView.updateUI(date: date, time: time, iconUrl: iconUrl, high: high, low: low)
    }
}
