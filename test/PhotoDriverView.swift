//
//  PhotoDriverView.swift
//  test
//
//  Created by System Administrator on 05.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var globalImgUrl : String!

class PhotoDriverView: UIViewController {

    @IBOutlet weak var photoImgOrder: UIImageView!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        flagMoveView = 1
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var imgURL: NSURL = NSURL(string: globalImgUrl)
        var imgData: NSData = NSData(contentsOfURL: imgURL)
        photoImgOrder.image = UIImage(data: imgData)
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
