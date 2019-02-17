//
//  ViewController.swift
//  What's the Weather
//
//  Created by IMCS2 on 2/16/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
import WebKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var cityName: UITextField!
    @IBAction func onSubmit(_ sender: Any) {
      
        let stringToShow = cityName.text
        let newStringToShow = stringToShow?.replacingOccurrences(of: " ", with: "-")
        let urlString = "https://www.weather-forecast.com/locations/" + newStringToShow! + "/forecasts/latest"
        let search = "p class=\"b-forecast__table-description-content\">"
        let url = URL(string: urlString)
        
        do {
            let contents = try String(contentsOf: url!)
          
           var newcontents=contents.components(separatedBy: "<")
            let index = newcontents.firstIndex(of: search)
            let newContents = newcontents[index!+1]
           var newcontents1 = newContents.components(separatedBy: ">")
            textview.text=newcontents1[1]
            textview.textColor = .black
           
         
        } catch {
            textview.text="Please enter a valid City name! "
           textview.backgroundColor = .white
            textview.textColor = .red
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor(patternImage: UIImage(named: "weather.jpeg")!)
    }
}

