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

    
    var item1 = ["full_name": "Carol Louie", "date_of_birth": "May 20, 1987"]
    var item2 = ["full_name": "Brian Best", "date_of_birth": "May 17, 1989"]
    var item3 = ["full_name": "Carol Louie", "date_of_birth": "May 20, 1987"]
    var item4 = ["full_name": "Brian Best", "date_of_birth": "May 17, 1989"]
    
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
        
        var userRef = ref.childByAppendingPath("Payment info")
        var user = ["item1": item1, "time2": item2 ]
        ref.setValue(user)
        

        
        
        
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

        
        
        
        
        })
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCellWithIdentifier("JokeCellTableViewCell") as! JokeCellTableViewCell
        
    }
    
}



/*
    
 
    class Joke {
        private var _jokeRef: Firebase!
        
        private var _jokeKey: String!
        private var _jokeText: String!
        private var _jokeVotes: Int!
        private var _username: String!
        
        var jokeKey: String {
            return _jokeKey
        }
        
        var jokeText: String {
            return _jokeText
        }
        
        var jokeVotes: Int {
            return _jokeVotes
        }
        
        var username: String {
            return _username
        }
        
        // Initialize the new Joke
        
        init(key: String, dictionary: Dictionary<String, AnyObject>) {
            self._jokeKey = key
            
            // Within the Joke, or Key, the following properties are children
            
            if let votes = dictionary["votes"] as? Int {
                self._jokeVotes = votes
            }
            
            if let joke = dictionary["jokeText"] as? String {
                self._jokeText = joke
            }
            
            if let user = dictionary["author"] as? String {
                self._username = user
            } else {
                self._username = ""
            }
            
            // The above properties are assigned to their key.
            
            self._jokeRef = DataService.dataService.JOKE_REF.childByAppendingPath(self._jokeKey)
        }
    }
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get username of the current user, and set it to currentUsername, so we can add it to the Joke.
        
        DataService.dataService.CURRENT_USER_REF.observeEventType(FEventType.Value, withBlock: { snapshot in
            
            let currentUser = snapshot.value.objectForKey("username") as! String
            
            print("Username: \(currentUser)")
            self.currentUsername = currentUser
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
      @IBAction func saveJoke(sender: AnyObject) {
        
        let jokeText = jokeField.text
        
        if jokeText != "" {
            
            // Build the new Joke.
            // AnyObject is needed because of the votes of type Int.
            
            let newJoke: Dictionary<String, AnyObject> = [
                "jokeText": jokeText!,
                "votes": 0,
                "author": currentUsername
            ]
            
            // Send it over to DataService to seal the deal.
            
            DataService.dataService.createNewJoke(newJoke)
            
            if let navController = self.navigationController {
                navController.popViewControllerAnimated(true)
            }
        }
    }
    
    
 
    func createNewJoke(joke: Dictionary<String, AnyObject>) {
        
        // Save the Joke
        // JOKE_REF is the parent of the new Joke: "jokes".
        // childByAutoId() saves the joke and gives it its own ID.
        
        let firebaseNewJoke = JOKE_REF.childByAutoId()
        
        // setValue() saves to Firebase.
        
        firebaseNewJoke.setValue(joke)
    }
    
    
   
    @IBAction func logout(sender: AnyObject) {
        
        // unauth() is the logout method for the current user.
        
        DataService.dataService.CURRENT_USER_REF.unauth()
        
        // Remove the user's uid from storage.
        
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        
        // Head back to Login!
        
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Login")
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
    }
    
    
    
    
    var jokes = [Joke]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observeEventType is called whenever anything changes in the Firebase - new Jokes or Votes.
        // It's also called here in viewDidLoad().
        // It's always listening.
        
        DataService.dataService.JOKE_REF.observeEventType(.Value, withBlock: { snapshot in
            
            // The snapshot is a current look at our jokes data.
            
            print(snapshot.value)
            
            self.jokes = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    // Make our jokes array for the tableView.
                    
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let joke = Joke(key: key, dictionary: postDictionary)
                        
                        // Items are returned chronologically, but it's more fun with the newest jokes first.
                        
                        self.jokes.insert(joke, atIndex: 0)
                    }
                }
                
            }
            
            // Be sure that the tableView updates when there is new data.
            
            self.tableView.reloadData()
        })
    }
    
    
  
      override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokes.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let joke = jokes[indexPath.row]
        
        // We are using a custom cell.
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("JokeCellTableViewCell") as? JokeCellTableViewCell {
            
            // Send the single joke to configureCell() in JokeCellTableViewCell.
            
            cell.configureCell(joke)
            
            return cell
            
        } else {
            
            return JokeCellTableViewCell()
            
        }
    }
    
    
    
    
    func configureCell(joke: Joke) {
        self.joke = joke
        
        // Set the labels and textView.
        
        self.jokeText.text = joke.jokeText
        self.totalVotesLabel.text = "Total Votes: \(joke.jokeVotes)"
        self.usernameLabel.text = joke.username
        
        // Set "votes" as a child of the current user in Firebase and save the joke's key in votes as a boolean.
        
        voteRef = DataService.dataService.CURRENT_USER_REF.childByAppendingPath("votes").childByAppendingPath(joke.jokeKey)
        
        // observeSingleEventOfType() listens for the thumb to be tapped, by any user, on any device.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            // Set the thumb image.
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                
                // Current user hasn't voted for the joke... yet.
                
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "thumb-down")
            } else {
                
                // Current user voted for the joke!
                
                self.thumbVoteImage.image = UIImage(named: "thumb-up")
            }
        })
    }
    
    
    
    var joke: Joke!
    var voteRef: Firebase!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UITapGestureRecognizer is set programatically.
        
        let tap = UITapGestureRecognizer(target: self, action: "voteTapped:")
        tap.numberOfTapsRequired = 1
        thumbVoteImage.addGestureRecognizer(tap)
        thumbVoteImage.userInteractionEnabled = true
    }
    
    
    func voteTapped(sender: UITapGestureRecognizer) {
        
        // observeSingleEventOfType listens for a tap by the current user.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "thumb-down")
                
                // addSubtractVote(), in Joke.swift, handles the vote.
                
                self.joke.addSubtractVote(true)
                
                // setValue saves the vote as true for the current user.
                // voteRef is a reference to the user's "votes" path.
                
                self.voteRef.setValue(true)
            } else {
                self.thumbVoteImage.image = UIImage(named: "thumb-up")
                self.joke.addSubtractVote(false)
                self.voteRef.removeValue()
            }
            
        })
    }
    
    
    
    func addSubtractVote(addVote: Bool) {
        
        if addVote {
            _jokeVotes = _jokeVotes + 1
        } else {
            _jokeVotes = _jokeVotes - 1
        }
        
        // Save the new vote total.
        
        _jokeRef.childByAppendingPath("votes").setValue(_jokeVotes)
        
    }
    
    
    @IBAction func buttonpayment(sender: AnyObject)
    {
        
        ref.setValue(userNameField.text!)
        //ref.setValue(addreesField.text!)
        //ref.setValue(phoneField.text!)
        //ref.setValue(brithdayField.text!)
        //ref.setValue(BanckAccField.text!)
        //ref.setValue(dataField.text!)

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ref.setValue("payement")
        ref.observeEventType(.Value, withBlock:{ snapshot in
        let message = snapshot.value as! String
        self.label.text = message
       // self.Addrees.text = message
       // self.Phone.text = message
        //self.Date_of_birth.text = message
        //self.BankAcoount.text = message
        //self.Expires_data.text = message

        })
    }
    
  /*  var item1   =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item2   =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item3   =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item4   =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]

    var item5   =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item6   =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item7   =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item8   =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]

    var item9   =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item10  =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item11  =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item12  =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]

    var item13  =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item14  =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item15  =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item16  =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]

    var item17  =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item18  =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item19  =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item20  =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]

    var item21  =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item22  =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item23  =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item24  =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]

    var item25  =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item26  =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item27  =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item28  =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]
    
    var item29  =  ["name": "Alan Turning", "item" : "Red Chair", "price": "100"]
    var item30  =  ["name": "Grace Hopper", "item": "Sofa Bed"  , "price": "120"]
    var item31  =  ["name": "James Cook"  , "item": "White Desk", "price": "250"]
    var item32  =  ["name": "James Cook"  , "item": "Mattress Cal King", "price": "100"]
    
        
        var usersRef = ref.childByAppendingPath("users")
        
        var users = ["item1": item1, "item2": item2, "item3" : item3 , "item4" : item4 ]
        
        usersRef.setValue(users)
        
        ref.queryOrderedByChild("price").observeEventType(.ChildAdded, withBlock: { snapshot in
            if let price = snapshot.value["price"] as? Int {
                print("\(snapshot.key) price at \(price) Dollars ")
                print(snapshot.key)
            }
        })
        
        
    }
    @IBAction func buttonpayment(sender: AnyObject)
    {
        ref.authWithCustomToken(userNameField.text, withCompletionBlock: { error, result in
        
        
            self.ref.authWithCustomToken(self.addreesField.text, withCompletionBlock: { error, result in
            
                
                self.ref.authWithCustomToken(self.phoneField.text, withCompletionBlock: { error, result in
                
                    
                    self.ref.authWithCustomToken(self.brithdayField.text, withCompletionBlock: { error, result in
                        
                        
                         self.ref.authWithCustomToken(self.brithdayField.text, withCompletionBlock: { error, result in
                            
                        })
                    })
                    
                })
            
            })
        
        })
        
        self.ref.observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
    
        self.ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.value.objectForKey("author"))
            print(snapshot.value.objectForKey("title"))
        })
        
        
        self.ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.value.objectForKey("author"))
            print(snapshot.value.objectForKey("title"))
        })
                

        self.ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.value.objectForKey("author"))
            print(snapshot.value.objectForKey("title"))
        })
        
                
        self.ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            print(snapshot.value.objectForKey("author"))
            print(snapshot.value.objectForKey("title"))
        })
                

        let user = ["username" : self.userNameField.text!]
       self.ref.childByAppendingPath("ApplcationPayment").setValue(user)
        
       let user1 = ["address" : self.addreesField.text!]
       self.ref.childByAppendingPath("ApplcationPayment").setValue(user)
        
       let user2 = ["phone" : self.phoneField.text!]
       self.ref.childByAppendingPath("ApplcationPayment").setValue(user)
        
       let user3 = ["brithday" : self.brithdayField.text!]
       self.ref.childByAppendingPath("ApplcationPayment").setValue(user)
        
       let user4 = ["BanckAcc" : self.BanckAccField.text!]
        self.ref.childByAppendingPath("ApplcationPayment").setValue(user)
       
        let user5 = ["data" : self.dataField.text!]
        self.ref.childByAppendingPath("ApplcationPayment").setValue(user)
    }
*/
    
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
 */
