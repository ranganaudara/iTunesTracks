//
//  TrackListViewController.swift
//  iTuneTracks
//
//  Created by Fortuna Global on 9/11/19.
//  Copyright © 2019 Rangana Udara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TrackListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let requestURL = "https://itunes.apple.com/search?term=tracks&media&music&limit=25"
    var tracks : [Track] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchTrackData()
    }
    
    func fetchTrackData(){
        DispatchQueue.main.async {
            Alamofire.request(self.requestURL).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value) :
                    let json = JSON(value)
                    print(json)
                    json["results"].array?.forEach({ (track) in
                        let track = Track(
                            track: track["trackName"].stringValue,
                            artist: track["artistName"].stringValue,
                            collection: track["collectionName"].stringValue,
                            priceTag: track["trackPrice"].doubleValue,
                            release: track["releaseDate"].stringValue,
                            img: track["artworkUrl100"].stringValue)
                        self.tracks.append(track)
                    })
                    self.tableView.reloadData()
                    
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            })
        }
    }
    
}

extension TrackListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //setting the number of rows we have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    
    //configuring each and every cell as it appears (called everytime a new cell comes to the screen)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //grabing the track at the indexPath i.e. the location in the array
        let track = tracks[indexPath.row]
        
        //making a custom cell (track cell)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackViewCell") as! TrackViewCell
        
        //set the values which we got from the array to cell (this function is wrtten inside TrackViewCell)
        cell.setTrack(track: track)
        
        cell.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        
        vc?.track = tracks[indexPath.row]
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
}



