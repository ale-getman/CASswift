//
//  DriversManagerTab.swift
//  test
//
//  Created by System Administrator on 12.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var globalDrivers : NSDictionary!

class DriversManagerTab: UITableViewController {

    var nameDriver_arr:[String] = []
    var techDriver_arr:[String] = []
    var numberDriver_arr:[String] = []
    var dateDriver_arr:[String] = []
    var adrDriver_arr:[String] = []
    var loc_xDriver_arr:[String] = []
    var loc_yDriver_arr:[String] = []
    var statusDriver_arr:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RequestToServ()
        sleep(2)
        createArrays()
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("onResume"), forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func onResume() {
        RequestToServ()
        sleep(2)
        createArrays()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return nameDriver_arr.count
    }

    func createArrays(){
        nameDriver_arr.removeAll(keepCapacity: true)
        techDriver_arr.removeAll(keepCapacity: true)
        numberDriver_arr.removeAll(keepCapacity: true)
        dateDriver_arr.removeAll(keepCapacity: true)
        adrDriver_arr.removeAll(keepCapacity: true)
        statusDriver_arr.removeAll(keepCapacity: true)
        loc_xDriver_arr.removeAll(keepCapacity: true)
        loc_yDriver_arr.removeAll(keepCapacity: true)
        
        var orders = globalDrivers! as Dictionary<String,AnyObject>
        var orders_data : AnyObject? = orders["data"]
        var orders_data_array = orders_data as Array<AnyObject>
        
        for var i = 0; i < orders_data_array.count; i++
        {
            var object_req : AnyObject? = orders_data_array[i]
            var Dict_req = object_req as Dictionary<String,AnyObject>
            var nameDriver_obj : AnyObject? = Dict_req["info"]
            var techDriver_obj : AnyObject? = Dict_req["tech"]
            var numberDriver_obj : AnyObject? = Dict_req["number"]
            var dateDriver_obj : AnyObject? = Dict_req["date"]
            var adrDriver_obj : AnyObject? = Dict_req["address"]
            var statusDriver_obj : AnyObject? = Dict_req["status"]
            var loc_xDriver_obj : AnyObject? = Dict_req["loc_x"]
            var loc_yDriver_obj : AnyObject? = Dict_req["loc_y"]
            //tech_driver_arr += tech_driver as String
            var nameDriver = nameDriver_obj as String
            var techDriver = techDriver_obj as String
            var numberDriver = numberDriver_obj as String
            var dateDriver = dateDriver_obj as String
            var adrDriver = adrDriver_obj as String
            var statusDriver = statusDriver_obj as String
            var loc_xDriver = loc_xDriver_obj as String
            var loc_yDriver = loc_yDriver_obj as String
            
            if statusDriver == "online"
            {
                nameDriver_arr.append(nameDriver)
                techDriver_arr.append(techDriver)
                numberDriver_arr.append(numberDriver)
                dateDriver_arr.append(dateDriver)
                adrDriver_arr.append(adrDriver)
                statusDriver_arr.append(statusDriver)
                loc_xDriver_arr.append(loc_xDriver)
                loc_yDriver_arr.append(loc_yDriver)
            }
        }
        
        for var i = 0; i < orders_data_array.count; i++
        {
            var object_req : AnyObject? = orders_data_array[i]
            var Dict_req = object_req as Dictionary<String,AnyObject>
            var nameDriver_obj : AnyObject? = Dict_req["info"]
            var techDriver_obj : AnyObject? = Dict_req["tech"]
            var numberDriver_obj : AnyObject? = Dict_req["number"]
            var dateDriver_obj : AnyObject? = Dict_req["date"]
            var adrDriver_obj : AnyObject? = Dict_req["address"]
            var statusDriver_obj : AnyObject? = Dict_req["status"]
            var loc_xDriver_obj : AnyObject? = Dict_req["loc_x"]
            var loc_yDriver_obj : AnyObject? = Dict_req["loc_y"]
            //tech_driver_arr += tech_driver as String
            var nameDriver = nameDriver_obj as String
            var techDriver = techDriver_obj as String
            var numberDriver = numberDriver_obj as String
            var dateDriver = dateDriver_obj as String
            var adrDriver = adrDriver_obj as String
            var statusDriver = statusDriver_obj as String
            var loc_xDriver = loc_xDriver_obj as String
            var loc_yDriver = loc_yDriver_obj as String
            
            if statusDriver == "offline"
            {
                nameDriver_arr.append(nameDriver)
                techDriver_arr.append(techDriver)
                numberDriver_arr.append(numberDriver)
                dateDriver_arr.append(dateDriver)
                adrDriver_arr.append(adrDriver)
                statusDriver_arr.append(statusDriver)
                loc_xDriver_arr.append(loc_xDriver)
                loc_yDriver_arr.append(loc_yDriver)
            }
        }

    }

    func RequestToServ(){
        let myUrl = NSURL(string: "http://82.146.52.50//dis//drivers.php/")
        let request = NSMutableURLRequest(URL:myUrl)
        request.HTTPMethod = "POST"
        // Compose a query string
        var postString = "metka=ok"
        
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
            
            //Let’s convert response sent from a server side script to a NSDictionary object:
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
            
            globalDrivers = myJSON
            
            // type tech flag id name date status technic who address loc_x loc_y image_url
        }
        
        task.resume()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("driversCell", forIndexPath: indexPath) as DriversManagerTabCell
        
        cell.nameProfile!.text = nameDriver_arr[indexPath.row]
        cell.techProfile!.text = "Техника:\(techDriver_arr[indexPath.row])"
        cell.numberProfile!.text = "Моб. номер:\(numberDriver_arr[indexPath.row])"
        cell.dateProfile!.text = "В приложении был:\(dateDriver_arr[indexPath.row])"
        cell.adrProfile!.text = "Местоположение:\(adrDriver_arr[indexPath.row])"
        
        if statusDriver_arr[indexPath.row] == "online"
        {
            if techDriver_arr[indexPath.row] == ""
            {
                cell.imgProfile!.image = UIImage(named: "manager_on")
                cell.techProfile!.hidden = true
            }
            else
            {
                cell.imgProfile!.image = UIImage(named: "driver_on")
            }
        }
        
        if statusDriver_arr[indexPath.row] == "offline"
        {
            if techDriver_arr[indexPath.row] == ""
            {
                cell.imgProfile!.image = UIImage(named: "manager_off")
                cell.techProfile!.hidden = true
            }
            else
            {
                cell.imgProfile!.image = UIImage(named: "driver_off")
            }
        }
        return cell
    }
    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
