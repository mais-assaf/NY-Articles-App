//
//  ArticalTableViewCell.swift
//  NYTimes
//
//  Created by Mais Assaf on 5/10/23.
//

import UIKit

class ArticalTableViewCell: UITableViewCell {

    static let nibName = "ArticalTableViewCell"
    @IBOutlet weak var articalImageView: UIView!
    @IBOutlet weak var articalImage: UIImageView!
    @IBOutlet weak var articalLabel: UILabel!
    @IBOutlet weak var articalInfoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(articalString: String, articalInfo: String, articalDate: String, imageURL: String) {
        articalLabel.text = articalString
        articalInfoLabel.text = articalInfo
        dateLabel.text = articalDate
        if !imageURL.isEmpty{
            let url = URL(string: imageURL)
            let data = try? Data(contentsOf: url!) 
            articalImage.image = UIImage(data: data!)
        }
    }
}
