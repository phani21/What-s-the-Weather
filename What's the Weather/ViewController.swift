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
    
        //print(newStringToShow!)
        
        let urlString = "https://www.weather-forecast.com/locations/" + newStringToShow! + "/forecasts/latest"
        let search = "p class=\"b-forecast__table-description-content\">"
    
        let url = URL(string: urlString)
        //https://www.weather-forecast.com/locations/New-York/forecasts/latest
        
        do {
            let contents = try String(contentsOf: url!)
          
           var newcontents=contents.components(separatedBy: "<")
            let i = newcontents.firstIndex(of: search)
            let newContents = newcontents[i!+1]
           // print( newContents)
         var newcon1 = newContents.components(separatedBy: ">")
            textview.text=newcon1[1]
            textview.textColor = .black
            //print(newcon1);print("nwcon1")
         
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

