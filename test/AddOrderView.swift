//
//  AddOrderView.swift
//  test
//
//  Created by System Administrator on 13.01.16.
//  Copyright (c) 2016 DIS. All rights reserved.
//

import UIKit

class AddOrderView: UIViewController {

    let spisokTech = ["Автобетононасос",
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
    
    @IBAction func createOrderBtn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func backBtn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
