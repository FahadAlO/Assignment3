//
//  PaymentTableViewController.swift
//  ShopGames
//
//  Created by Fahid_Alothman on 4/7/16.
//  Copyright © 2016 Fahid Othman. All rights reserved.
//

import UIKit
import Firebase


class PaymentTableViewController: UITableViewController
{

     let  ref = Firebase(url:"https://shopgames.firebaseio.com")
    
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var addreesField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var brithdayField: UITextField!
    @IBOutlet weak var BanckAccField: UITextField!
    @IBOutlet weak var dataField: UITextField!
    

  
    var item1     =    ["name": "CD name", "item" : "", "price": "$"]
    var item2     =    ["name": "CD name", "item": ""  , "price": "$"]
    var item3     =    ["name": "CD name"  , "item": "", "price": "$"]
    var item4     =    ["name": "CD name"  , "item": "", "price": "$"]
    
    var item5     =    ["name": "CD name", "item" : "", "price": "$"]
    var item6     =    ["name": "CD name", "item": ""  , "price": "$"]
    var item7     =    ["name": "CD name"  , "item": "", "price": "$"]
    var item8     =    ["name": "CD name"  , "item": "", "price": "$"]
    
    var item9     =    ["name": "CD name", "item" : "", "price": "$"]
    var item10     =    ["name": "CD name", "item": ""  , "price": "$"]
    var item11    =    ["name": "CD name"  , "item": "", "price": "$"]
    var item12    =    ["name": "CD name"  , "item": "", "price": "$"]
    
    var item13    =    ["name": "CD name", "item" : "", "price": "$"]
    var item14    =    ["name": "CD name", "item": ""  , "price": "$"]
    var item15    =    ["name": "CD name"  , "item": "", "price": "$"]
    var item16    =    ["name": "CD name"  , "item": "", "price": "$"]
    
 
    @IBAction func buttonpayment(sender: AnyObject)
    {
        
            let usersRef = ref.childByAppendingPath("users")
            
            let users = ["item1": item1, "item2": item2, "item3" : item3 , "item4" : item4 item1, "item2": item2, "item3" : item3 , "item4" : item4 item1, "item2": item2, "item3" : item3 , "item4" : item4]
            
            usersRef.setValue(users)
        
        
        ref.queryOrderedByChild("price").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let price = snapshot.value["price"] as? Int {
                print("\(snapshot.key) price at \(price) Dollars ")
                print(snapshot.key)
            }
        })
        
    }
    
      override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
