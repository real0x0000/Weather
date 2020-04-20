//
//  ForecastView.swift
//  Weather
//
//  Created by Anuwat Sittichak on 20/4/2563 BE.
//

import UIKit

public class ForecastView: UIView {
    
    private var contentView: UIView?
    
    @IBOutlet var frameView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var highLabel: UILabel!
    @IBOutlet var lowLabel: UILabel!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        xibSetup()
    }
    
    private func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
        setupUI()
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView()
        }
        return view
    }
    
    private func setupUI() {
        
    }
    
    func updateUI(date: String, time: String, iconUrl: URL?, high: Double, low: Double) {
        dateLabel.text = date
        timeLabel.text = time
        imageView.setImage(with: iconUrl)
        highLabel.text = "\(high)"
        lowLabel.text = "\(low)"
    }
}
