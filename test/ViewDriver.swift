//
//  ViewDriver.swift
//  test
//
//  Created by System Administrator on 28.12.15.
//  Copyright (c) 2015 DIS. All rights reserved.
//

import UIKit

var globalbuffer : String!

class ViewDriver: UIViewController{

    @IBOutlet weak var bufText: UITextView!
    var opener: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bufText.text = globalbuffer
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
