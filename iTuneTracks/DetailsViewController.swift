//
//  DetailsViewController.swift
//  iTuneTracks
//
//  Created by Fortuna Global on 9/11/19.
//  Copyright © 2019 Rangana Udara. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var detaiImageView: UIImageView!
    @IBOutlet var trackName: UILabel!
    @IBOutlet var collectionName: UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var priceTag: UILabel!
    @IBOutlet var artistName: UILabel!
    
    var track: Track = Track(track: "", artist: "", collection: "", priceTag: 0.0, release: "", img: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30)

        
        let imgUrl = URL(string: track.imgUrl)
        detaiImageView.layer.masksToBounds = true
        detaiImageView.layer.cornerRadius = 16.0
        detaiImageView.clipsToBounds = true
        detaiImageView.kf.setImage(
            with: imgUrl,
            placeholder: UIImage(named: "placeholderImage")
        )
        trackName.text = "Track Name\t\t: \(track.trackName)"
        collectionName.text = "Collection\t\t\t: \(track.collectionName)"
        releaseDate.text = "Released\t\t\t: \(track.releaseDate)"
        priceTag.text = "Price\t\t\t\t: \(track.price)"
        artistName.text = "Artist\t\t\t\t: \(track.artistName)"
        
    }

}
