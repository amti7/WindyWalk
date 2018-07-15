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
    @IBOutlet var dayOnTempSixAfternoonLabel: UILabel!
    
    @IBOutlet var dayTwoWeekDay: UILabel!
    @IBOutlet var dayTwoTempMidnightLabel: UILabel!
    @IBOutlet var dayTwoTemSixOLabel: UILabel!
    @IBOutlet var dayTwoTempTwelbeOLabel: UILabel!
    @IBOutlet var dayTwoTempSixAfternoonLabel: UILabel!
    
    @IBOutlet var dayThreeWeekDay: UILabel!
    @IBOutlet var dayThreeTempMidnightLabel: UILabel!
    @IBOutlet var dayThreeTempSixOLabel: UILabel!
    @IBOutlet var dayThreeTempTwelveOLabel: UILabel!
    @IBOutlet var dayThreeTempSixAfternoonLabel: UILabel!
    
    @IBOutlet var dayFourWeekDay: UILabel!
    @IBOutlet var dayFourTempMidnightLabel: UILabel!
    @IBOutlet var dayFourOneTemSixOLabel: UILabel!
    @IBOutlet var dayFourTempTwelveOLabel: UILabel!
    @IBOutlet var dayFourTempSixAfternoonLabel: UILabel!
    
    var labelsBox: Array<Array<UILabel>> = []
    var firstLabelBox: Array<UILabel> = []
    var secondLabelBox: Array<UILabel> = []
    var thirdLabelBox: Array<UILabel> = []
    var fourthLabelBox: Array<UILabel> = []
    
    var forecastArrayFromMainVC: Array<Forecast> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectDesiredHours()
    }
 
    func selectDesiredHours(){
        var date = Date()
        let dateFormatterE = DateFormatter()
        let dateFormatter = DateFormatter()
        date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
        dateFormatterE.dateFormat = "EEEE"
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        var dateString = dateFormatter.string(from: date)
        firstLabelBox = [dayOneTempMidnightLabel,dayOneTempSixOLabel,dayOneTempTwelveOLabel,dayOnTempSixAfternoonLabel,dayOneWeekDay]
        secondLabelBox = [dayTwoTempMidnightLabel,dayTwoTemSixOLabel,dayTwoTempTwelbeOLabel,dayTwoTempSixAfternoonLabel,dayTwoWeekDay]
        thirdLabelBox = [dayThreeTempMidnightLabel,dayThreeTempSixOLabel,dayThreeTempTwelveOLabel,dayThreeTempSixAfternoonLabel,dayThreeWeekDay]
        fourthLabelBox = [dayFourTempMidnightLabel,dayFourOneTemSixOLabel,dayFourTempTwelveOLabel,dayFourTempSixAfternoonLabel,dayFourWeekDay]
        
        labelsBox.append(firstLabelBox)
        labelsBox.append(secondLabelBox)
        labelsBox.append(thirdLabelBox)
        labelsBox.append(fourthLabelBox)
        
        var i = 1
        var yCoordinate = 110
        for singleWeatherParam in forecastArrayFromMainVC{
            
            if ((singleWeatherParam.date?.hasPrefix(dateString))! && i<5) {

                selectLabelToAccurateDate(count: i)[4].text = dateFormatterE.string(from: date)
                if(singleWeatherParam.date?.hasSuffix("00:00:00"))!{
                    displayImageWithSpecificStateAndPosition(imageName: displayProperIconToWeatherState(weatherParam: singleWeatherParam), xParam: 110, yParam: yCoordinate)
                    selectLabelToAccurateDate(count: i)[0].text = transposeWeatherParamToStringInCelcius(temp: singleWeatherParam.temperature!)
                } else if(singleWeatherParam.date?.hasSuffix("06:00:00"))!{
                    displayImageWithSpecificStateAndPosition(imageName: displayProperIconToWeatherState(weatherParam: singleWeatherParam), xParam: 160, yParam: yCoordinate)
                    selectLabelToAccurateDate(count: i)[1].text = transposeWeatherParamToStringInCelcius(temp: singleWeatherParam.temperature!)
                } else if(singleWeatherParam.date?.hasSuffix("12:00:00"))!{
                    displayImageWithSpecificStateAndPosition(imageName: displayProperIconToWeatherState(weatherParam: singleWeatherParam), xParam: 210, yParam: yCoordinate)
                    selectLabelToAccurateDate(count: i)[2].text = transposeWeatherParamToStringInCelcius(temp: singleWeatherParam.temperature!)
                } else if(singleWeatherParam.date?.hasSuffix("18:00:00"))!{
                    displayImageWithSpecificStateAndPosition(imageName: displayProperIconToWeatherState(weatherParam: singleWeatherParam), xParam: 260, yParam: yCoordinate)
                    selectLabelToAccurateDate(count: i)[3].text = transposeWeatherParamToStringInCelcius(temp: singleWeatherParam.temperature!)
                    date = Calendar.current.date(byAdding: .day, value: +1, to: date)!
                    dateString = dateFormatter.string(from: date)
                    i += 1
                    yCoordinate += 75
                }
            }
        }
    }
    
    func displayProperIconToWeatherState(weatherParam: Forecast) -> String {
        switch(weatherParam.state!){
        case "clear sky":
            if(weatherParam.date?.hasSuffix("00:00:00"))!{
                return "clear-night"
            } else {
                return "clear"
            }
        case "scattered clouds","broken clouds","scattered clouds","few clouds","overcast clouds":
            if(weatherParam.date?.hasSuffix("00:00:00"))!{
                return "cloudy-night"
            } else {
                return "cloudy"
            }
        case "light rain","moderate rain":
            return "rain"
        case "light snow":
            return "snow"
        default:
            return "default"
        }
    }

    func selectLabelToAccurateDate(count: Int) -> Array<UILabel>{
        switch(count) {
        case 1:
            return labelsBox[0]
        case 2:
            return labelsBox[1]
        case 3:
            return labelsBox[2]
        case 4:
            return labelsBox[3]
        default:
            print("invalid number of forecast returning an error...")
            return labelsBox[-1]
        }
    }
    
    func transposeWeatherParamToStringInCelcius(temp: Double) -> String{
        let temperaturToReturn = String(describing: (Double(round( 10 * (temp - 273.15))/10))) + "°c"
        return temperaturToReturn
    }
    
    func displayImageWithSpecificStateAndPosition(imageName: String,xParam: Int, yParam: Int) {
        var image: UIImage = UIImage(named: imageName)!
        let dayOneAheadImage = UIImageView(image: image)
        dayOneAheadImage.frame = CGRect(origin: CGPoint(x: xParam,y :yParam), size: CGSize(width: 30, height: 30))
        self.view.addSubview(dayOneAheadImage)
        
    }
}
