//
//  OrderDriverTable.swift
//  test
//
//  Created by System Administrator on 04.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var bufRequest: NSDictionary!

var globalId_arr : [String] = []

var flagMoveView = 0

class OrderDriverTable: UITableViewController {
    
    var tech_driver_arr:[String] = []
    var status_arr:[String] = []
    var id_name_date_arr:[String] = []
    var technic_order_arr:[String] = []
    var address_arr:[String] = []
    var imgurl_arr:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("didLoad")
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
        createArrays()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        if flagMoveView == 1
        {
            println("didMove")
            flagMoveView = 0
            onResume()
        }
    }
    
    func createArrays(){
        tech_driver_arr.removeAll(keepCapacity: true)
        status_arr.removeAll(keepCapacity: true)
        id_name_date_arr.removeAll(keepCapacity: true)
        technic_order_arr.removeAll(keepCapacity: true)
        address_arr.removeAll(keepCapacity: true)
        globalId_arr.removeAll(keepCapacity: true)
        imgurl_arr.removeAll(keepCapacity: true)
        
        var orders = bufRequest! as Dictionary<String,AnyObject>
        var orders_data : AnyObject? = orders["data"]
        var orders_data_array = orders_data as Array<AnyObject>
        
        for var i = 0; i < orders_data_array.count; i++
        {
            var object_req : AnyObject? = orders_data_array[i]
            var Dict_req = object_req as Dictionary<String,AnyObject>
            var tech_driver_obj : AnyObject? = Dict_req["tech"]
            var id_obj : AnyObject? = Dict_req["id"]
            var name_obj : AnyObject? = Dict_req["name"]
            var date_obj : AnyObject? = Dict_req["date"]
            var status_obj : AnyObject? = Dict_req["status"]
            var technic_order_obj : AnyObject? = Dict_req["technic"]
            var address_obj : AnyObject? = Dict_req["address"]
            var imgurl_obj : AnyObject? = Dict_req["image_url"]
            //tech_driver_arr += tech_driver as String
            var tech_driver = tech_driver_obj as String
            var status = status_obj as String
            var id = id_obj as String
            var name = name_obj as String
            var date = date_obj as String
            var technic_order = technic_order_obj as String
            var address = address_obj as String
            var imgurl = imgurl_obj as String
            
            if tech_driver == technic_order
            {
                tech_driver_arr.append(tech_driver)
                status_arr.append(status)
                id_name_date_arr.append(id+name+"-"+date)
                technic_order_arr.append(technic_order)
                address_arr.append(address)
                globalId_arr.append(id)
                imgurl_arr.append(imgurl)
            }
            
        }

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
        return tech_driver_arr.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as OrderDriverTableCell
        
        cell.nameOrder!.text = id_name_date_arr[indexPath.row]
        cell.statusOrder!.text = status_arr[indexPath.row]
        
        if status_arr[indexPath.row] == "открыт"
        {
            cell.imgStatus!.image = UIImage(named: "open")
        }
        if status_arr[indexPath.row] == "выполняется"
        {
            cell.imgStatus!.image = UIImage(named: "inwork")
        }
        if status_arr[indexPath.row] == "закрыт"
        {
            cell.imgStatus!.image = UIImage(named: "close")
        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*if segue.identifier == "OrderDriverTabID" {
            if let destination = segue.destinationViewController as? UITabBarController {
                if let blogIndex = tableView.indexPathForSelectedRow()?.row {
                    println(id_name_date_arr[blogIndex])
                }
            }
        }*/
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(id_name_date_arr[indexPath.row])
        nameOrderText = id_name_date_arr[indexPath.row]
        technicOrderText = technic_order_arr[indexPath.row]
        addressOrderText = address_arr[indexPath.row]
        statusOrderText = status_arr[indexPath.row]
        globalId = globalId_arr[indexPath.row]
        globalImgUrl = imgurl_arr[indexPath.row]
        //var toShow = self.storyboard?.instantiateViewControllerWithIdentifier("OrderDriverTabID") as UITabBarController
        //self.navigationController?.pushViewController(toShow, animated: true)
        
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell! {
    let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
    
    cell.nameLab!.text = id_name_date_arr[indexPath.row]
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
