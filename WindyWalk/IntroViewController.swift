//
//  ViewController.swift
//  WindyWalk
//
//  Created by Kamil Gacek on 15/02/2018.
//  Copyright © 2018 Kamil Gacek. All rights reserved.
//

import UIKit
import ObjectMapper
import MBProgressHUD

class IntroViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var cityNameTextField: UITextField!
    
    var forecast: ExtendedForecast?
    var weekForecast: WeekForecast?
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()

    @IBAction func userAskedForForecast(_ sender: Any) {
        var cityName = cityNameTextField.text
        var url = "http://api.openweathermap.org/data/2.5/forecast?q=" + cityName! + "&appid=e3eeed175d5b660c006531bcb3a0117e"
        retrieveParamsByObjectMapper(path: url)
    }

    private func showLoadingHUD(){
        let hud = MBProgressHUD.showAdded(to: contentView, animated: true)
        hud.label.text = "Loading..."
    }
    
    private func hideLoadingHUD(){
        MBProgressHUD.hide(for:contentView, animated: true)
    }
    
    func retrieveParamsByObjectMapper( path: String) {
        showLoadingHUD()
        guard let url = URL(string: path) else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String,Any> else {
                    print("error")
                    return
                }
                self?.weekForecast = WeekForecast(JSON: json)
                
                if let forecasT = ExtendedForecast(JSON: json) {
                    self?.forecast = forecasT
                    DispatchQueue.main.async {
                        if(self?.forecast?.temperature != nil) {
                            self?.performSegue(withIdentifier: "IntroSegue", sender: self)
                        } else {
                            let alert = UIAlertController(title: "Error", message: "The city is not existing in the system.",preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            self?.hideLoadingHUD()
                            self?.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            } catch {
                fatalError("Error: Unnable to parse JSON...")
            }
            }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController: MainViewController = segue.destination as! MainViewController
        DestViewController.forecastArray = (weekForecast?.forecastArray)!
        DestViewController.forecast = forecast
    }
}
