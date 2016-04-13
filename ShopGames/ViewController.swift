//
//  ViewController.swift
//  ShopGames
//
//  Created by Fahid_Alothman on 4/5/16.
//  Copyright © 2016 Fahid Othman. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController
{    
    
   let ref = Firebase(url: "https://shopgames.firebaseio.com")
    
       
  var screen: [String] = ["Xcode.png","Xcode1.png","Xcode2.png","Xcode3.png","Xcode4.png","Xcode5.png","Xcode6.png","Xcode7.png","Xcode8.png","Xcode9.png","Xcode10.png","Xcode11.png","Xcode12.png","Xcode13.png","Xcode14.png","Xcode15.png","email.png","facebook.png","password2.png","Screen.png","Screen10.png","Screen11.png","Screen12.png","Screen13.png","Screen14.png","Screen15.png","Screen2.png"
    ,"Screen3.png","Screen4.png","Screen5.png","Screen6.png","Screen7.png","Screen8.png","Screen9.png","Screen1.png","tumblr.png","twitter.png","UserName.png"]
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passweordField: UITextField!
    
       
      @IBAction func handleCreateaccount(sender: AnyObject)
    { 
       
       
       }
       
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


  




