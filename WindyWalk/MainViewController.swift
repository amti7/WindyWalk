//
//  ForecastForTomorrowViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 21/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import UIKit

enum ErrorType: Error {
    case ForecastDataNotObtained
    
}

class MainViewController: UIViewController {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var downFallLabel: UILabel!
    @IBOutlet var downFallValueLabel: UILabel!
    @IBOutlet var windLabel: UILabel!

    var forecast: ExtendedForecast?
    var forecastArray: Array<Forecast> = []
    
    override func viewDidLoad() {
        do {
            try self.fillUIWithObtainedData(forecast: forecast!)
        } catch ErrorType.ForecastDataNotObtained(let description) {
            print(description)
        }
        var iconType = self.displayProperIconToWeatherState(extForecast: forecast!)
        self.displayImageWithSpecificStateAndPosition(imageName: iconType, xParam: 115, yParam: 170)

    }

    func fillUIWithObtainedData(forecast: ExtendedForecast){
        temperatureLabel.text = String(transposeWeatherParamToStringInCelcius(temp: forecast.temperature!))
        stateLabel.text = forecast.state!
        windLabel.text = String(describing: forecast.wind!) + " m/s"
        dateLabel.text = forecast.date
        cityNameLabel.text = String(forecast.cityName!)
        downFallLabel.text = forecast.typeOfDownfall
        downFallValueLabel.text = String(describing: forecast.downfall!) + " mm"
        humidityLabel.text = String(forecast.humidity!) + " %"
        
    }
    
    func transposeWeatherParamToStringInCelcius(temp: Double) -> String{
        let temperaturToReturn = String(describing: (Double(round( 10 * (temp - 273.15))/10))) + "°c"
        return temperaturToReturn
    }
    
    func displayImageWithSpecificStateAndPosition(imageName: String,xParam: Int, yParam: Int) {
        let image: UIImage = UIImage(named: imageName)!
        let dayOneAheadImage = UIImageView(image: image)
        dayOneAheadImage.frame = CGRect(origin: CGPoint(x: xParam,y :yParam), size: CGSize(width: 80, height: 80))
        self.view.addSubview(dayOneAheadImage)
    }
    
    func displayProperIconToWeatherState(extForecast: ExtendedForecast) -> String {
        var returnString = ""
        if let weatherParam = Optional(extForecast) {
            switch(weatherParam.state!){
            case "clear sky":
                if(weatherParam.date?.hasSuffix("00:00:00"))!{
                    returnString =  "clear-night"
                } else {
                    returnString =  "clear"
                }
            case "scattered clouds","broken clouds","scattered clouds","few clouds","overcast clouds":
                if(weatherParam.date?.hasSuffix("00:00:00"))!{
                    returnString =  "cloudy-night"
                } else {
                    returnString =  "cloudy"
                }
            case "light rain","moderate rain":
                returnString =  "rain"
            case "light snow":
                returnString =  "snow"
            default:
                returnString =  "default"
            }
        }
        return returnString
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController: DetailsViewController = segue.destination as! DetailsViewController
        DestViewController.forecastArrayFromMainVC = forecastArray
    }
}
