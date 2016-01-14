//
//  ViewController.swift
//  test
//
//  Created by System Administrator on 23.12.15.
//  Copyright (c) 2015 DIS. All rights reserved.
//
//http://www.techotopia.com/index.php/A_Swift_Example_iOS_8_Location_Application

//https://www.youtube.com/watch?v=xVEH_rrPbTQ
import UIKit
import CoreLocation

var globalLogin : String!
var globalPas : String!
var globalAddress : String!
var globalLong, globalLat : String!

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var textLogin: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    var latitude,longitude : String!
    var lati,longi : CLLocationDegrees!
    var address_str = "dom"
    var adr = "1"
    var flag = false
    var loca: CLLocation!
    //let pieVC = ViewDriver(nibName: "ViewDriver", bundle: nil)
    var type_string = ""
    var flag_string = ""
    var VC: ViewDriver!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLogin.text = "muser"
        textPassword.text = "pass"
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        println("hello")
        
        //pieVC.delegate = self
        //reverseGeoCode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!)
    {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        latitude = String(format: "%.4f",
            latestLocation.coordinate.latitude)
        longitude = String(format: "%.4f",
            latestLocation.coordinate.longitude)
        
        lati = latestLocation.coordinate.latitude
        longi = latestLocation.coordinate.longitude
        
        if startLocation == nil {
            startLocation = latestLocation as CLLocation
        }
        
        var distanceBetween: CLLocationDistance =
        latestLocation.distanceFromLocation(startLocation)
        
        loca = CLLocation(latitude: lati, longitude: longi)
        flag = true
        
        globalLong = longitude
        globalLat = latitude
        
        getLocationAddress(loca)
    }
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!) {
            
    }
    
    func getLocationAddress(location:CLLocation) {
        var geocoder = CLGeocoder()
        
        //println("-> Finding user address...")
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error)->Void in
            var placemark:CLPlacemark!
            
            if error == nil && placemarks.count > 0 {
                placemark = placemarks[0] as CLPlacemark
                
                var addressString : String = ""
                if placemark.ISOcountryCode == "TW" /*Address Format in Chinese*/ {
                    if placemark.country != nil {
                        addressString = placemark.country
                    }
                    if placemark.subAdministrativeArea != nil {
                        addressString = addressString + placemark.subAdministrativeArea + ", "
                    }
                    if placemark.postalCode != nil {
                        addressString = addressString + placemark.postalCode + " "
                    }
                    if placemark.locality != nil {
                        addressString = addressString + placemark.locality
                    }
                    if placemark.thoroughfare != nil {
                        addressString = addressString + placemark.thoroughfare
                    }
                    if placemark.subThoroughfare != nil {
                        addressString = addressString + placemark.subThoroughfare
                    }
                } else {
                    if placemark.subThoroughfare != nil {
                        addressString = placemark.subThoroughfare + " "
                    }
                    if placemark.thoroughfare != nil {
                        addressString = addressString + placemark.thoroughfare + ", "
                    }
                    if placemark.postalCode != nil {
                        addressString = addressString + placemark.postalCode + " "
                    }
                    if placemark.locality != nil {
                        addressString = addressString + placemark.locality + ", "
                    }
                    if placemark.administrativeArea != nil {
                        addressString = addressString + placemark.administrativeArea + " "
                    }
                    if placemark.country != nil {
                        addressString = addressString + placemark.country
                    }
                }
                
                //println(addressString)
                globalAddress = addressString
                self.address_str = addressString
            }
        })
    }
    
    @IBAction func acptBtn(sender: AnyObject) {
        startLocation = nil
        println("btn")
        
        globalLogin = textLogin.text
        globalPas = textPassword.text
        
        if flag
        {
            RequestToServ()
            sleep(2)
            println(type_string)
            if type_string == "водитель"
            {
                println("type is driver")
                
                var toShow = self.storyboard?.instantiateViewControllerWithIdentifier("DriverTabID") as UITabBarController
                self.navigationController?.pushViewController(toShow, animated: true)
            }
            else
            {
                println("type is manager")
                
                var toShow = self.storyboard?.instantiateViewControllerWithIdentifier("ManagerTabID") as UITabBarController
                self.navigationController?.pushViewController(toShow, animated: true)
            }
        }

    }
    
    func RequestToServ(){
        let myUrl = NSURL(string: "http://82.146.52.50//dis//login_a.php/")
        let request = NSMutableURLRequest(URL:myUrl)
        request.HTTPMethod = "POST"
        // Compose a query string
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond | .CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let seconds = components.second
        let years = components.year
        let month = components.month
        let day = components.day
        println("h m s: \(hour):\(minutes):\(seconds) \(day).\(month).\(years)")
        println("login: \(textLogin.text) ,password: \(textPassword.text)")
        
        var postString = "login=\(textLogin.text)&pass=\(textPassword.text)&loc_x=\(longitude)&loc_y=\(latitude)&time=\(hour):\(minutes):\(seconds) \(day).\(month).\(years)&address=\(address_str)&network_status=online"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                println("error=\(error)")
                return
            }
            
            // You can print out response object
            //println("response = \(response)")
            
            // Print out response body
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            //println("responseString = \(responseString)")
            //ViewDriver.buffText = responseString
            globalbuffer = responseString
            //Let’s convert response sent from a server side script to a NSDictionary object:
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
            
            bufRequest = myJSON
            bufRequest_2 = myJSON
            //println("myJSON: \(myJSON)")
            
            var orders = myJSON! as Dictionary<String,AnyObject>
            var orders_data : AnyObject? = orders["data"]
            var orders_data_array = orders_data as Array<AnyObject>
            
            var flag_object : AnyObject? = orders_data_array[0]
            var flagDict = flag_object as Dictionary<String,AnyObject>
            var flag : AnyObject? = flagDict["flag"]
            self.flag_string = flag as String
            println("flag: \(self.flag_string)")
            
            if self.flag_string == "true"
            {
                var type_object : AnyObject? = orders_data_array[0]
                var typeDict = type_object as Dictionary<String,AnyObject>
                var type : AnyObject? = typeDict["type"]
                self.type_string = type as String
            }
            else
            {
                println("flag is false")
            }
            
            
            // type tech flag id name date status technic who address loc_x loc_y image_url
        }
        
        task.resume()
    }

}

