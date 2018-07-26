//
//  SettingVC.swift
//  delegate_notification
//
//  Created by rokihiro on 2018/06/23.
//  Copyright © 2018年 rokihiro. All rights reserved.
//

import UIKit

// :classでclassにのみ使われるprotocol
// 循環参照にならないようにweakで宣言したいから
protocol SettingVCDelegate: class {
    var name:String { get set }
    func settingVCWillClose(_ settingVC:SettingVC)
}

class SettingVC: UIViewController {
    weak var delegate:SettingVCDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushSetViaDelegateButton(_ sender: Any) {
        guard let _delegate = self.delegate else{
            return
        }
        
        _delegate.name = self.nameTextField.text ?? "no name"
        _delegate.settingVCWillClose(self)
    }
    
    @IBAction func pushSetViaNotification(_ sender: Any) {
        NotificationCenter.default.post(name: HomeVC.nameNotification, object: nil, userInfo:["name":self.nameTextField.text ?? "no name"])
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
