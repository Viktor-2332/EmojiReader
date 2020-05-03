//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by Витек on 4/29/20.
//  Copyright © 2020 Витек. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    @IBOutlet private weak var EnjoeLAbeel: UILabel!
    @IBOutlet private weak var NameLabel: UILabel!
    @IBOutlet private weak var GeroesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(emoji: Emoji) {
        NameLabel.text = emoji.name
        GeroesLabel.text = emoji.description
        EnjoeLAbeel.text = emoji.emooji
        NameLabel.text = "🏄‍♂️"
    }
}
