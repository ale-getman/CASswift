//
//  AddOrderView.swift
//  test
//
//  Created by System Administrator on 13.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

class AddOrderView: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    let spisokTech:[String] = ["Автобетононасос",
        "Автовышка",
        "Автогрейдер",
        "Автокран",
        "Ассенизаторская машина",
        "Асфальтоукладчик",
        "Бульдозер",
        "Генератор",
        "Гидромолот",
        "Грунторез",
        "Длинномер",
        "Дорожная фреза",
        "Илосос",
        "Каток",
        "Коммунальная машина",
        "Компрессор",
        "Манипулятор",
        "Мини-погрузчик",
        "Мини-экскаватор",
        "Низкорамная платформа",
        "Поливомоечная машина ", 
        "Самосвал", 
        "Фронтальный погрузчик", 
        "Экскаватор гусеничный", 
        "Экскаватор колёсный", 
        "Экскаватор погрузчик", 
        "Ямобур"]
    
    @IBOutlet weak var codeOrder: UITextField!
    @IBOutlet weak var techPicker: UIPickerView!
    @IBOutlet weak var adrOrder: UITextField!
    
    var chooseTech : String!
    
    @IBAction func createOrderBtn(sender: AnyObject) {
        
        if codeOrder.text != ""
        {
            if adrOrder.text != ""
            {
                RequestToServ()
                RequestToServAll()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        techPicker.dataSource = self
        techPicker.delegate = self
        
        chooseTech = spisokTech[0]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func RequestToServ(){
        let myUrl = NSURL(string: "http://82.146.52.50//dis//add_zakaz.php/")
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
        
        var postString = "name=\(codeOrder.text)&tech=\(chooseTech)&addr=\(adrOrder.text)&data=\(day)\(month)\(years)&status=открыт"
        
        println(postString)
        
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
            
            //println("myJSON: \(myJSON)")
            // type tech flag id name date status technic who address loc_x loc_y image_url
        }
        
        task.resume()
    }
    
    func RequestToServAll(){
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
        
        var postString = "login=\(globalLogin)&pass=\(globalPas)&loc_x=\(globalLong)&loc_y=\(globalLat)&time=\(hour):\(minutes):\(seconds) \(day).\(month).\(years)&address=\(globalAddress)&network_status=online"
        
        println(postString)
        
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
            
            bufRequest_2 = myJSON
            //println("myJSON: \(myJSON)")
            // type tech flag id name date status technic who address loc_x loc_y image_url
        }
        
        task.resume()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //println(spisokTech[row])
        chooseTech = spisokTech[row]
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return spisokTech.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return spisokTech[row]
    }

}
