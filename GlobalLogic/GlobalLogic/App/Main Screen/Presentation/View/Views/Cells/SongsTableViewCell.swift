//
//  SongsTableViewCell.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import UIKit
import SDWebImage

class SongsTableViewCell: UITableViewCell {

    static let identifier = "SongsTableViewCell"
    @IBOutlet var albumImageView: UIImageView!
    @IBOutlet var trackLabel: UILabel!
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: "SongsTableViewCell", bundle: nil)
    }

    public func configure(with song: SongModel) {
        let imageUrl = song.trackViewUrl

        albumImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "blank"))
        albumImageView.contentMode = .scaleAspectFill

        trackLabel.text = song.trackName
        trackLabel.font = UIFont(name: Fonts.robotoCondensed, size: 22)
        trackLabel.textColor = .white

        albumLabel.text = song.collectionName
        albumLabel.font = UIFont(name: Fonts.robotoCondensed, size: 16)
        albumLabel.textColor = .white

        artistLabel.text = song.artistName
        artistLabel.font = UIFont(name: Fonts.robotoCondensed, size: 16)
        artistLabel.textColor = .white

        contentView.backgroundColor = .black
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
