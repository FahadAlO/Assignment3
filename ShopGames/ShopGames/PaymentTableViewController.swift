//
//  PaymentTableViewController.swift
//  ShopGames
//
//  Created by Fahid_Alothman on 4/7/16.
//  Copyright © 2016 Fahid Othman. All rights reserved.
//

import UIKit
import Foundation
import Firebase


class PaymentTableViewController: UITableViewController
{
    let  ref = Firebase(url:"https://shopgames.firebaseio.com/Bank")

    
    @IBOutlet weak var Full_name: UILabel!
    @IBOutlet weak var Addrees: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Date_of_birth: UILabel!
    @IBOutlet weak var BankAcoount: UILabel!
    @IBOutlet weak var Expires_data: UILabel!
    
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var addreesField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var brithdayField: UITextField!
    @IBOutlet weak var BanckAccField: UITextField!
    @IBOutlet weak var dataField: UITextField!
    

    @IBAction func paymentbutton(sender: AnyObject) {
        ref.setValue(userNameField.text!)
        ref.setValue(addreesField.text!)
        ref.setValue(phoneField.text!)
        ref.setValue(brithdayField.text!)
        ref.setValue(BanckAccField.text!)
        ref.setValue(dataField.text!)
        
    }

    override func viewDidLoad() {
      
        super.viewDidLoad()
        
     
      ref.setValue("Payment info")
        ref.observeEventType(.Value, withBlock:{
        snapshot in
            
            
            let message = snapshot.value as! String
            
            
            self.Full_name.text = message
            self.Addrees.text = message
            self.Phone.text = message
            self.Date_of_birth.text = message
            self.BanckAccField.text = message
            self.dataField.text = message

            
            let user = ["username" : self.userNameField.text!]
            self.ref.childByAppendingPath("Bank_info").setValue(user)
            
            _ = ["address" : self.addreesField.text!]
            self.ref.childByAppendingPath("Bank_info").setValue(user)
            
            _ = ["phone" : self.phoneField.text!]
            self.ref.childByAppendingPath("Bank_info").setValue(user)
            
            _ = ["brithday" : self.brithdayField.text!]
            self.ref.childByAppendingPath("Bank_info").setValue(user)
            
            _ = ["BanckAcc" : self.BanckAccField.text!]
            self.ref.childByAppendingPath("Bank_info").setValue(user)
            
            _ = ["data" : self.dataField.text!]
            self.ref.childByAppendingPath("Bank_info").setValue(user)
        
        
        })
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
 

  //  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

      //  return cell
  //  }



    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }



    // Override to support rearranging the table view.
    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
 


    // Override to support conditional rearranging of the table view.
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

