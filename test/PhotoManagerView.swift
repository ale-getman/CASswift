//
//  PhotoManagerView.swift
//  test
//
//  Created by System Administrator on 13.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var globalImgUrl_2 : String!

class PhotoManagerView: UIViewController {

    @IBOutlet weak var photoOrder: UIImageView!
    
    @IBAction func backBtn(sender: AnyObject) {
        flagMoveView_2 = 1
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if globalImgUrl_2 != ""
        {
            var imgURL: NSURL = NSURL(string: globalImgUrl_2)
            var imgData: NSData = NSData(contentsOfURL: imgURL)
            photoOrder.image = UIImage(data: imgData)
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
