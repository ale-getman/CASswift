//
//  OrderDriverView.swift
//  test
//
//  Created by System Administrator on 05.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var nameOrderText,technicOrderText,addressOrderText,statusOrderText,globalId: String!

class OrderDriverView: UIViewController {

    @IBOutlet weak var nameOrder: UILabel!
    @IBOutlet weak var technicOrder: UILabel!
    @IBOutlet weak var addressOrder: UILabel!
    @IBOutlet weak var statusOrder: UILabel!
    @IBOutlet weak var statusImg: UIImageView!
    
    @IBAction func acceptBtn(sender: AnyObject) {
        statusOrderText = "выполняется"
        statusOrder.text = statusOrderText
        statusImg!.image = UIImage(named: "inwork")
        RequestToServ()
        RequestToServAll()
    }
    
    @IBAction func readyBtn(sender: AnyObject) {
        statusOrderText = "закрыт"
        statusOrder.text = statusOrderText
        statusImg!.image = UIImage(named: "close")
        RequestToServ()
        RequestToServAll()
    }
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        flagMoveView = 1
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameOrder.text = nameOrderText
        technicOrder.text = technicOrderText
        addressOrder.text = addressOrderText
        statusOrder.text = statusOrderText
        println(statusOrder.text)
        if statusOrder.text == "открыт"
        {
            statusImg!.image = UIImage(named: "open")
        }
        if statusOrder.text == "выполняется"
        {
            statusImg!.image = UIImage(named: "inwork")
        }
        if statusOrder.text == "закрыт"
        {
            statusImg!.image = UIImage(named: "close")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func RequestToServ(){
        let myUrl = NSURL(string: "http://82.146.52.50//dis//accept.php/")
        let request = NSMutableURLRequest(URL:myUrl)
        request.HTTPMethod = "POST"
        // Compose a query string
        println(statusOrder.text)
        var postString = "login=\(globalLogin)&id=\(globalId)&status=\(statusOrderText)"
        
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
            
            bufRequest = myJSON
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

}
