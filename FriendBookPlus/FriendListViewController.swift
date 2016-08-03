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
    
    var friends = ["Marie", "Elaine", "George", "Krammer", "Jamie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let friend = self.friends[indexPath.row]
        cell.textLabel!.text = friend
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
        detailVC.friendName = sender as! String
            }
}

