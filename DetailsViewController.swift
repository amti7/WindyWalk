//
//  ForecastForNextDaysViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 22/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var dayOneWeekDay: UILabel!
    @IBOutlet var dayOneTempMidnightLabel: UILabel!
    @IBOutlet var dayOneTempSixOLabel: UILabel!
    @IBOutlet var dayOneTempTwelveOLabel: UILabel!
    @IBOutlet var dayOneTempSixAfternoonLabel: UILabel!
    @IBOutlet var dayTwoWeekDay: UILabel!
    @IBOutlet var dayTwoTempMidnightLabel: UILabel!
    @IBOutlet var dayTwoTempSixOLabel: UILabel!
    @IBOutlet var dayTwoTempTwelveOLabel: UILabel!
    @IBOutlet var dayTwoTempSixAfternoonLabel: UILabel!
    @IBOutlet var dayThreeWeekDay: UILabel!
    @IBOutlet var dayThreeTempMidnightLabel: UILabel!
    @IBOutlet var dayThreeTempSixOLabel: UILabel!
    @IBOutlet var dayThreeTempTwelveOLabel: UILabel!
    @IBOutlet var dayThreeTempSixAfternoonLabel: UILabel!
    @IBOutlet var dayFourWeekDay: UILabel!
    @IBOutlet var dayFourTempMidnightLabel: UILabel!
    @IBOutlet var dayFourTempSixOLabel: UILabel!
    @IBOutlet var dayFourTempTwelveOLabel: UILabel!
    @IBOutlet var dayFourTempSixAfternoonLabel: UILabel!
    @IBOutlet weak var imageViewDayOneMidnight: UIImageView!
    @IBOutlet weak var imageViewDayOneSixO: UIImageView!
    @IBOutlet weak var imageViewDayOneTwelve: UIImageView!
    @IBOutlet weak var imageViewDayOneSixAfternoon: UIImageView!
    @IBOutlet weak var imageViewDayTwoMidnight: UIImageView!
    @IBOutlet weak var imageViewDayTwoSixO: UIImageView!
    @IBOutlet weak var imageViewDayTwoTwelve: UIImageView!
    @IBOutlet weak var imageViewDayTwoSixAfternoon: UIImageView!
    @IBOutlet weak var imageViewDayThreeMidnight: UIImageView!
    @IBOutlet weak var imageViewDayThreeSixO: UIImageView!
    @IBOutlet weak var imageViewDayThreeTwelve: UIImageView!
    @IBOutlet weak var imageViewDayThreeSixAfternoon: UIImageView!
    @IBOutlet weak var imageViewDayFourMidnight: UIImageView!
    @IBOutlet weak var imageViewDayFourSixO: UIImageView!
    @IBOutlet weak var imageViewDayFourTwelve: UIImageView!
    @IBOutlet weak var imageViewDayFourSixAfternoon: UIImageView!

    var forecastArrayFromMainVC: Array<Forecast> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectDesiredHours()
    }
 
    func selectDesiredHours(){
        var date = Date()
        let dateFormatter = DateFormatter()
        date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var dateString = dateFormatter.string(from: date)
        
        let dayOneArray = [[dayOneTempMidnightLabel,imageViewDayOneMidnight],[dayOneTempSixOLabel,imageViewDayOneSixO],[dayOneTempTwelveOLabel,imageViewDayOneTwelve],[dayOneTempSixAfternoonLabel,imageViewDayOneSixAfternoon]]
        let dayTwoArray = [[dayTwoTempMidnightLabel,imageViewDayTwoMidnight],[dayTwoTempSixOLabel,imageViewDayTwoSixO],[dayTwoTempTwelveOLabel,imageViewDayTwoTwelve],[dayTwoTempSixAfternoonLabel,imageViewDayTwoSixAfternoon]]
        let dayThreeArray = [[dayThreeTempMidnightLabel,imageViewDayThreeMidnight],[dayThreeTempSixOLabel,imageViewDayThreeSixO],[dayThreeTempTwelveOLabel,imageViewDayThreeTwelve],[dayThreeTempSixAfternoonLabel,imageViewDayThreeSixAfternoon]]
        let dayFourArray = [[dayFourTempMidnightLabel,imageViewDayFourMidnight],[dayFourTempSixOLabel,imageViewDayFourSixO],[dayFourTempTwelveOLabel,imageViewDayFourTwelve],[dayFourTempSixAfternoonLabel,imageViewDayFourSixAfternoon]]
        
        var daysArray = [dayOneArray,dayTwoArray,dayThreeArray,dayFourArray]
        
        var c = 0
        print(dateString)
        for singleWeatherParam in forecastArrayFromMainVC {
            if ((singleWeatherParam.date?.hasPrefix(dateString))! && c<4) {
                if singleWeatherParam.temperature != nil {
                    if(singleWeatherParam.date?.hasSuffix("00:00:00"))!{
                        temperatureInCelcius(temp: singleWeatherParam.temperature!, label: daysArray[c][0][0] as! UILabel)
                        assignToWeatherStateIcon(weatherParam: singleWeatherParam, weatherIconImage: daysArray[c][0][1] as! UIImageView)
                    } else if(singleWeatherParam.date?.hasSuffix("06:00:00"))!{
                        temperatureInCelcius(temp: singleWeatherParam.temperature!, label: daysArray[c][1][0] as! UILabel)
                        assignToWeatherStateIcon(weatherParam: singleWeatherParam, weatherIconImage: daysArray[c][1][1] as! UIImageView)
                    } else if(singleWeatherParam.date?.hasSuffix("12:00:00"))!{
                        temperatureInCelcius(temp: singleWeatherParam.temperature!, label: daysArray[c][2][0] as! UILabel)
                        assignToWeatherStateIcon(weatherParam: singleWeatherParam, weatherIconImage: daysArray[c][2][1] as! UIImageView)
                    } else if(singleWeatherParam.date?.hasSuffix("18:00:00"))!{
                        temperatureInCelcius(temp: singleWeatherParam.temperature!, label: daysArray[c][3][0] as! UILabel)
                        assignToWeatherStateIcon(weatherParam: singleWeatherParam, weatherIconImage: daysArray[c][3][1] as! UIImageView)
                        date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
                        dateString = dateFormatter.string(from: date)
                        c += 1
                    }
                }
            }
        }
    }
    
    func assignToWeatherStateIcon(weatherParam: Forecast, weatherIconImage: UIImageView) {
        var weatherState = ""
        switch(weatherParam.state!){
        case "clear sky":
            if(weatherParam.date?.hasSuffix("00:00:00"))!{
                weatherState = "clear-night"
            } else {
                weatherState = "clear"
            }
        case "scattered clouds","broken clouds","scattered clouds","few clouds","overcast clouds":
            if(weatherParam.date?.hasSuffix("00:00:00"))!{
                weatherState = "cloudy-night"
            } else {
                weatherState = "cloudy"
            }
        case "light rain","moderate rain":
            weatherState = "rain"
        case "light snow":
            weatherState = "snow"
        default:
            weatherState = "default"
        }
        let image: UIImage = UIImage(named: weatherState)!
        weatherIconImage.image = image
        self.view.addSubview(weatherIconImage)
    }
    
    func temperatureInCelcius(temp: Double, label: UILabel){
        label.text = String(describing: (Double(round( 10 * (temp - 273.15))/10))) + "°c"
    }
    
    func displayImageWithSpecificStateAndPosition(imageName: String,xParam: Int, yParam: Int) {
        var image: UIImage = UIImage(named: imageName)!
        let dayOneAheadImage = UIImageView(image: image)
        dayOneAheadImage.frame = CGRect(origin: CGPoint(x: xParam,y :yParam), size: CGSize(width: 30, height: 30))
        self.view.addSubview(dayOneAheadImage)
    }
}
