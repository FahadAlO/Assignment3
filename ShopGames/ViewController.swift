//
//  ViewController.swift
//  ShopGames
//
//  Created by Fahid_Alothman on 4/5/16.
//  Copyright © 2016 Fahid Othman. All rights reserved.
// 
//


import UIKit
import Foundation
import Firebase

class ViewController: UIViewController
{    
    
   let ref = Firebase(url: "https://shopgames.firebaseio.com")
    
   let  reef = Firebase(url:"https://shopgames.firebaseio.com/Bank_info")

    
    var item1 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
 
    var item2 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    var item3 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]

    var item4 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    var item5 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    var item6 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    var item7 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    var item8 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    var item9 = ["Full_name": "Alan Turning", "Address" : "Red st", "Phone": "0475838343","Data_of_birth" : "01/08/1991", "BankAccount" :"358347272", "Expires_data" :"01/04/2017" ]
    
    
  var screen: [String] = ["Xcode.png","Xcode1.png","Xcode2.png","Xcode3.png","Xcode4.png","Xcode5.png","Xcode6.png","Xcode7.png","Xcode8.png","Xcode9.png","Xcode10.png","Xcode11.png","Xcode12.png","Xcode13.png","Xcode14.png","Xcode15.png","email.png","facebook.png","password2.png","Screen.png","Screen10.png","Screen11.png","Screen12.png","Screen13.png","Screen14.png","Screen15.png","Screen2.png"
    ,"Screen3.png","Screen4.png","Screen5.png","Screen6.png","Screen7.png","Screen8.png","Screen9.png","Screen1.png","tumblr.png","twitter.png","UserName.png"]
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passweordField: UITextField!
    

   // this when you wnat to have new account in this app 
    @IBAction func handleCreateaccount(sender: AnyObject)
    {
  
        
        if usernameField.text!.isEmpty || emailField.text!.isEmpty || passweordField.text!.isEmpty
            
        {
            
            let myAlert = UIAlertController(title:"Alert", message:"You need to register", preferredStyle: UIAlertControllerStyle.Alert);
            
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
                
            }
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated:true, completion:nil);
            
        }
            
        else
            
        {
            
            ref.createUser(emailField.text!, password: passweordField.text!, withValueCompletionBlock: { error, result in
                
                if error != nil
                {
                    
                    print("something went wrong!!")
                    
                }
                
                else
                
                {
                    
                    let uid = result["uid"] as? String
                    
                    print("Thank you for register with uid: \(uid)")
                    
                    let user = ["username" : self.usernameField.text!]
                    self.ref.childByAppendingPath("users/\(uid)").setValue(user)
                    
                }
            })
        }
        
    }
    
    
    // this when you have already had an account
    @IBAction func handleSigin(sender: AnyObject)
    {
        
        
        
        if usernameField.text!.isEmpty || emailField.text!.isEmpty || passweordField.text!.isEmpty {
            
            
            let myAlert = UIAlertController(title:"Alert", message:"You need to Login", preferredStyle: UIAlertControllerStyle.Alert);
            
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
                
            }
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated:true, completion:nil);
            
        }
            
        else
            
        {
            
            ref.authUser(emailField.text!, password: passweordField.text!, withCompletionBlock: { error, authData in
                if error != nil
                {
                    print("Unable to SigIn user")
                }
                    
                else
                {
                    let uid = authData.uid
                    print("Login successful with uid:\(uid)")
                    
                }
                
            })
            
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       // Do any additional setup after loading the view, typically from a nib.
    
        
        
        ref.queryOrderedByChild("Payment info").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let price = snapshot.value["make payment for user"] as? Int {
                print("\(snapshot.key) price at \(price) Dollars ")
                print(snapshot.key)
            }
        })

        _ = ref.childByAppendingPath("Payment info")
    let user = ["item1": item1, "time2": item2 , "time3": item3 , "time4": item4 , "time5": item5 , "time6": item6 , "time7": item7 , "time8": item8 , "time9": item9]
        reef.setValue(user)
        

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}












  






  






  






  




