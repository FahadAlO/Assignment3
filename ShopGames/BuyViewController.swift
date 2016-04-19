//
//  BuyViewController.swift
//  ShopGames
//
//  Created by Fahid_Alothman on 4/17/16.
//  Copyright © 2016 Fahid Othman. All rights reserved.
//

import UIKit
import Foundation
import Firebase


class BuyViewController: UIViewController {

    
    let  ref = Firebase(url:"https://shopgames.firebaseio.com/Bank")
    
   // @IBOutlet weak var Full_name: UILabel!
  //  @IBOutlet weak var Addrees: UILabel!
  //  @IBOutlet weak var Phone: UILabel!
  //  @IBOutlet weak var Data_of_birth: UILabel!
  //  @IBOutlet weak var BanckAcoount: UILabel!
 //   @IBOutlet weak var Expires_data: UILabel!
  
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var addreesField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var brithdayField: UITextField!
    @IBOutlet weak var BanckAccField: UITextField!
    @IBOutlet weak var dataField: UITextField!
    
    
    @IBAction func paybutton(sender: AnyObject) {
    
    /*
        ref.setValue("Payment info")
        ref.observeEventType(.Value, withBlock:{
        snapshot in
            
            let message = snapshot.value as! String
            self.Full_name.text = message
            self.Addrees.text = message
            self.Phone.text = message
            self.Data_of_birth.text = message
            self.BanckAcoount.text = message
            self.Expires_data.text = message
            
        })
        
       // ref.setValue(userNameField.text!)
       // ref.setValue(addreesField.text!)
       // ref.setValue(phoneField.text!)
       // ref.setValue(brithdayField.text!)
        //ref.setValue(BanckAccField.text!)
       // ref.setValue(dataField.text!)
    */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      /*  // Do any additional setup after loading the view.
        
             ref.setValue("Payment info")
            ref.observeEventType(.Value, withBlock:{
            snapshot in
                
            let message = snapshot.value as! String
                
    
                self.Full_name.text! = message
                self.Addrees.text! = message
                self.Phone.text! = message
                self.Data_of_birth.text! = message
                self.BanckAcoount.text! = message
                self.dataField.text! = message
                
            })

    */
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
