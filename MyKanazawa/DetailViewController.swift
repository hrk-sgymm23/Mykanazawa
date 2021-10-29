//
//  DetailViewController.swift
//  MyKanazawa
//
//  Created by 杉山悠己 on 2021/10/27.
//

import UIKit

class DetailViewController: UIViewController {
    
//    var kanazawaList : [(name:String, address:String, url:URL)]!
//    var kanazawaList : [(name:String, address:String)]!
//    var facilities:[facilitiesJson]?
    var kanazawa_name = ""
    var kanazawa_address = ""
    var kanazawa_url = ""
    
    
    
    
    
//    @IBOutlet weak var FacilitesNameLabel: UILabel!
//    @IBOutlet weak var AddresLabel: UILabel!
//    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameLabel.text = kanazawaList[1]
        nameLabel.text = kanazawa_name
//        addressLabel.text = kanazawaList[2].address
        addressLabel.text = kanazawa_address
        linkLabel.text = kanazawa_url
//        let stringurl = kanazawaList[3].url.absoluteString
//        linkLabel.text = stringurl
    }
    
}
