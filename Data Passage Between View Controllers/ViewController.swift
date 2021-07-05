//
//  ViewController.swift
//  Data Passage Between View Controllers
//
//  Created by Elif Korkmaz on 5.07.2021.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Instance Property
    
    @IBAction func WithInstanceProperty(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "secondVC") as? SecondViewController else { return }
        
        secondVC.text = "Data passage with instance property"
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    
    //MARK: - Delegation

    @IBAction func WithDelegation(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "secondVC") as? SecondViewController else { return }
        
        secondVC.delegate = self
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    
    //MARK: - Notification Center
    
    @IBAction func WithNotificationCenter(_ sender: Any) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "notificationName"), object: nil, userInfo: ["data" : "Data passage with notification center"])
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(identifier: "secondVC") as? SecondViewController else { return }
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    
    //MARK: - Closure
    
    func dataPassageWithClosure(completion: @escaping (_ data: String) -> String) {
        let dataBackFromSecondVC = completion("Data passage with closure")
        print(dataBackFromSecondVC)
    }
   
}



//MARK: - SecondViewControllerDelegate Extension
extension ViewController: SecondViewControllerDelegate {
    func dataPassageWithDelegation(data: String) -> String {
        print(data)
        return "Data passage with delegation"
    }
}
