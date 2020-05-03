//
//  EmojiTableViewModel.swift
//  EmojiReader
//
//  Created by Витек on 5/3/20.
//  Copyright © 2020 Витек. All rights reserved.
//

import UIKit

class EmojiTableViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    var objects = [
        Emoji(emooji: "🤼‍♀️", name: "Sports", description: "Let's play basket", isFavourite: false),
        Emoji(emooji: "🛹", name: "Skeyt", description: "Let's play skeyt", isFavourite: false),
        Emoji(emooji: "🏹", name: "Arbalet", description: "Let's play arbalet", isFavourite: false)
    ]
    
    // MARK: - Table view data source

    // Значение по умолчанию - 1 - так что жтот метод можно не реализовывать )
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emogiCell", for: indexPath) as! EmojiTableViewCell
        let object = objects[indexPath.row]
        cell.configure(emoji: object)
        return cell
    }
    
    func tableView(_tableView: UITableView, editingStileForRowAt indexPatch: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView (_ tableView: UITableView, canMoveRowAt indexPatch: IndexPath) -> Bool {
        return true
    }
    
    func tableView (_ tableView: UITableView, moveRowAt sourseIndexPatch: IndexPath, to destinationIndexPatch: IndexPath)  {
        let movedEmoji = objects.remove(at: sourseIndexPatch.row)
        objects.insert(movedEmoji, at: destinationIndexPatch.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [])
    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (actioon, view, completion) in
            self.objects.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        return action
    }
        //MARK: - Delegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
