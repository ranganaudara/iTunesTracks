//
//  TrackViewCell.swift
//  iTuneTracks
//
//  Created by Fortuna Global on 9/11/19.
//  Copyright © 2019 Rangana Udara. All rights reserved.
//

import UIKit
import Kingfisher

class TrackViewCell: UITableViewCell {

    @IBOutlet var trackImageView: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var collectionNameLabel: UILabel!
    
    
    func setTrack(track: Track) {
        
        let imgUrl = URL(string: track.imgUrl)
        
        trackNameLabel.text = track.trackName
        collectionNameLabel.text = track.collectionName
        
        trackImageView.layer.masksToBounds = true
        trackImageView.layer.cornerRadius = trackImageView.bounds.width / 2
        trackImageView!.kf.setImage(
            with: imgUrl,
            placeholder: UIImage(named: "placeholderImage")
        )
    }
}
