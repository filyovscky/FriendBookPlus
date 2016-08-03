//
//  ViewController.swift
//  FriendBookPlus
//
//  Created by Yakov Filyovsky on 03/08/16.
//  Copyright © 2016 Yakov Filyovsky. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createFriends()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    
    func createFriends() {
        let Marie = Friend()
        Marie.name = "Marie"
        Marie.phoneNumber = "564574584"
        Marie.birthday = "25th April"
        Marie.picture = UIImage(named: "I8F8St9-sMI")!
        self.friends.append(Marie)
        
        let filthyfrank = Friend()
        filthyfrank.name = "Filthy Frank"
        filthyfrank.phoneNumber = "123456"
        filthyfrank.birthday = "14th September"
        filthyfrank.picture = UIImage(named: "timeline_1414581023_00031")!
        self.friends.append(filthyfrank)
        
        let pinkguy = Friend()
        pinkguy.name = "Pink Guy"
        pinkguy.phoneNumber = "10000000"
        pinkguy.birthday = "5th June"
        pinkguy.picture = UIImage(named: "tumblr_mydi7gmp7K1qhiw03o3_1280")!
        self.friends.append(pinkguy)
        
        let salamanderman = Friend()
        salamanderman.name = "Salamander Man"
        salamanderman.phoneNumber = "6482395"
        salamanderman.birthday = "9th July"
        salamanderman.picture = UIImage(named: "i")!
        self.friends.append(salamanderman)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend.name
        return cell
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let friend = self.friends[indexPath.row]
        self.performSegueWithIdentifier("detailSegue", sender: friend)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! FriendDetailViewController
        detailVC.friend = sender as! Friend
            }
}

