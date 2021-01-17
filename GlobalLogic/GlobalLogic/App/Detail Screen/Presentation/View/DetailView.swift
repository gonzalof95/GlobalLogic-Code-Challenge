//
//  DetailView.swift
//  GlobalLogic
//
//  Created by Gonzalo Ivan Fuentes on 17/01/2021.
//

import UIKit
import PureLayout
import SDWebImage

class DetailView: UIView {
    let scrollView = UIScrollView(forAutoLayout: ())
    let containerView = UIView(forAutoLayout: ())
    let albumImageView = UIImageView(forAutoLayout: ())
    let trackLabel = UILabel(forAutoLayout: ())
    let artistLabel = UILabel(forAutoLayout: ())
    let albumLabel = UILabel(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        self.backgroundColor = .black

        scrollView.addSubview(containerView)
        containerView.addSubview(albumImageView)
        containerView.addSubview(trackLabel)
        containerView.addSubview(artistLabel)
        containerView.addSubview(albumLabel)
        addSubview(scrollView)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        scrollView.autoPinEdgesToSuperviewEdges()
        containerView.autoPinEdgesToSuperviewEdges()

        containerView.autoMatch(.width, to: .width, of: self)
        containerView.autoMatch(.height, to: .height, of: self).priority = .defaultLow

        albumImageView.clipsToBounds = true

        trackLabel.font = UIFont(name: Fonts.robotoCondensed, size: 24)
        trackLabel.textColor = .white
        trackLabel.numberOfLines = 0
        trackLabel.textAlignment = .center

        artistLabel.font = UIFont(name: Fonts.robotoCondensed, size: 18)
        artistLabel.textColor = .white
        artistLabel.textAlignment = .center

        albumLabel.font = UIFont(name: Fonts.robotoCondensed, size: 14)
        albumLabel.textColor = .white
        albumLabel.textAlignment = .center
    }

    private func setupConstraints() {
        albumImageView.autoPinEdge(.top, to: .top, of: containerView, withOffset: 50)
        albumImageView.autoSetDimensions(to: CGSize(width: 100, height: 100))
        albumImageView.autoAlignAxis(.vertical, toSameAxisOf: containerView)

        trackLabel.autoPinEdge(.top, to: .bottom, of: albumImageView, withOffset: 24)
        trackLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 20)
        trackLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -20)

        artistLabel.autoPinEdge(.top, to: .bottom, of: trackLabel, withOffset: 14)
        artistLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 20)
        artistLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -20)

        albumLabel.autoPinEdge(.top, to: .bottom, of: artistLabel, withOffset: 14)
        albumLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 20)
        albumLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -20)
    }

    func configure(song: SongModel) {
        albumImageView.sd_setImage(with: URL(string: song.trackViewUrl))
        trackLabel.text = song.trackName
        artistLabel.text = song.artistName
        albumLabel.text = song.collectionName

    }
}
