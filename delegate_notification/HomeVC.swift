//
//  HomeVC.swift
//  delegate_notification
//
//  Created by rokihiro on 2018/06/23.
//  Copyright © 2018年 rokihiro. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,SettingVCDelegate {

    @IBOutlet weak var nameLabelForDelegate: UILabel!
    @IBOutlet weak var nameLabelForNotification: UILabel!
    var name:String = ""
    static let nameNotification = NSNotification.Name("nameNotification")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(settingVCWillCloseViaNotification), name: HomeVC.nameNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func settingVCWillClose(_ settingVC:SettingVC) {
        print("will close")
        self.nameLabelForDelegate.text = "Hello, "+name
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func settingVCWillCloseViaNotification(_ notification:Notification){
    
        if let userInfo = notification.userInfo{
            if let name = userInfo["name"] as? String{
                self.nameLabelForNotification.text = "Hello, "+name
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueHomeToSettingView" {
            let destVC = segue.destination as? SettingVC
            destVC?.delegate = self
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
