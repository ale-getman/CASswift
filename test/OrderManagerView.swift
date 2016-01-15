//
//  OrderManagerView.swift
//  test
//
//  Created by System Administrator on 13.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var nameOrderText_2,technicOrderText_2,addressOrderText_2,statusOrderText_2,globalId_2: String!

class OrderManagerView: UIViewController {

    @IBOutlet weak var nameOrder: UILabel!
    @IBOutlet weak var techOrder: UILabel!
    @IBOutlet weak var addressOrder: UILabel!
    @IBOutlet weak var statusOrder: UILabel!
    @IBOutlet weak var imgStatusOrder: UIImageView!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        flagMoveView_2 = 1
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameOrder.text = nameOrderText_2
        techOrder.text = technicOrderText_2
        addressOrder.text = addressOrderText_2
        statusOrder.text = statusOrderText_2
        println(statusOrder.text)
        
        if statusOrder.text == "открыт"
        {
            imgStatusOrder!.image = UIImage(named: "open")
        }
        if statusOrder.text == "выполняется"
        {
            imgStatusOrder!.image = UIImage(named: "inwork")
        }
        if statusOrder.text == "закрыт"
        {
            imgStatusOrder!.image = UIImage(named: "close")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
