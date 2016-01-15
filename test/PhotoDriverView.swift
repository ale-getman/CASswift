//
//  PhotoDriverView.swift
//  test
//
//  Created by System Administrator on 05.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

var globalImgUrl : String!

class PhotoDriverView: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var photoImgOrder: UIImageView!
    
    @IBAction func backBtn(sender: UIBarButtonItem) {
        flagMoveView = 1
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func selectPhoto(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createPhoto(sender: AnyObject) {
        /*imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)*/
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        photoImgOrder.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImgOrder.contentMode = UIViewContentMode.ScaleAspectFill
        photoImgOrder.clipsToBounds = true
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendPhoto(sender: AnyObject) {
        RequestToServ()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if globalImgUrl != ""
        {
            var imgURL: NSURL = NSURL(string: globalImgUrl)
            var imgData: NSData = NSData(contentsOfURL: imgURL)
            photoImgOrder.image = UIImage(data: imgData)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func RequestToServ(){
        let myUrl = NSURL(string: "http://82.146.52.50//dis//Upload_image_ANDROID//upload_image.php/")
        let request = NSMutableURLRequest(URL:myUrl)
        request.HTTPMethod = "POST"
        // Compose a query string
        var image = photoImgOrder.image
        var imageData = UIImagePNGRepresentation(image)
        var base64String = imageData.base64EncodedStringWithOptions(.allZeros)
        
        var postString = "image=\(base64String)&id=\(globalId)"
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
            //Let’s convert response sent from a server side script to a NSDictionary object:
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error:&err) as? NSDictionary
            
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
