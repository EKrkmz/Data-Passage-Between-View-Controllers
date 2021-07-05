//
//  SecondViewController.swift
//  Data Passage Between View Controllers
//
//  Created by Elif Korkmaz on 5.07.2021.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func dataPassageWithDelegation(data: String) -> String
}

class SecondViewController: UIViewController {

    @IBOutlet weak var instancePropertyLabel: UILabel!
    @IBOutlet weak var closureLabel: UILabel!
    @IBOutlet weak var delegationLabel: UILabel!
    @IBOutlet weak var notificationCenterLabel: UILabel!
    
    var text = "Label"
    var vc = ViewController()
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //MARK: - Instance Property
        instancePropertyLabel.text = text
        
        
        
        //MARK: - Closure
        vc.dataPassageWithClosure(completion: { data in
            self.closureLabel.text = data
            return "Data passage with closure is succeeded"
        })
        
        
        
        //MARK: - Delegation
        delegationLabel.text = delegate?.dataPassageWithDelegation(data: "Data passage with delegation is succeeded") ?? "Label"
        
        
        
        //MARK: - Notification Center
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: Notification.Name(rawValue: "notificationName"), object: nil)

    }

    @objc func onNotification(notification: Notification) {
        let data = notification.userInfo?["data"] as! String
        notificationCenterLabel.text = data
    }

}
