//
//  EmojiTableViewController.swift
//  EmojiReader
//
//  Created by Витек on 4/29/20.
//  Copyright © 2020 Витек. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {
   
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = EmojiTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        self.title = "Emoji Reader"
       
    }
   
}
