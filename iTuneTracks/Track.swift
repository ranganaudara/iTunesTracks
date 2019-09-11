//
//  Track.swift
//  iTuneTracks
//
//  Created by Fortuna Global on 9/11/19.
//  Copyright © 2019 Rangana Udara. All rights reserved.
//

import Foundation

class Track {
    var trackName : String
    var artistName : String
    var collectionName : String
    var price : Double
    var releaseDate: String
    var imgUrl: String
    
    init(track : String, artist : String, collection : String, priceTag : Double, release: String, img: String) {
        trackName = track
        artistName = artist
        collectionName = collection
        price = priceTag
        releaseDate = release
        imgUrl = img
    }
}
