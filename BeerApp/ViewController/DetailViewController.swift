//
//  DetailViewController.swift
//  BeerApp
//
//  Created by Hammed opejin on 5/9/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerId: UILabel!
    @IBOutlet weak var beerDescription: UITextView!
    
    var beer: Beer!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBindViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    func setBindViews() {
        beerDescription.text = beer.description
        beerName.text = beer.name
        beerId.text = beer.id
        
        let url = beer.imageUrl
        DownloadService.shared.downloadImage(url: url) {[unowned self] image in
            let img = image != nil ? image : #imageLiteral(resourceName: "beer")
            
            DispatchQueue.main.async {
                self.beerImage.image = img
            }
        }
    }

}
