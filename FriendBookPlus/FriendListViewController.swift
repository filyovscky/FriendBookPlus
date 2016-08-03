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
        self.friends.append(Marie)
        
        let George = Friend()
        George.name = "George"
        George.phoneNumber = "123456"
        George.birthday = "14th September"
        self.friends.append(George)
        
        let Krammer = Friend()
        Krammer.name = "Krammer"
        Krammer.phoneNumber = "10000000"
        Krammer.birthday = "5th June"
        self.friends.append(Krammer)
        
        let Jerry = Friend()
        Jerry.name = "Jerry"
        Jerry.phoneNumber = "6482395"
        Jerry.birthday = "9th July"
        self.friends.append(Jerry)
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

