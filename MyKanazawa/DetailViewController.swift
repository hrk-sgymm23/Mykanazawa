//
//  DetailViewController.swift
//  MyKanazawa
//
//  Created by 杉山悠己 on 2021/10/27.
//

import UIKit

class DetailViewController: UIViewController {
    
    var kanazawa_name = ""
    var kanazawa_address = ""
    var kanazawa_url = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressText: UITextView!
    @IBOutlet weak var linkText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = kanazawa_name
        addressText.text = kanazawa_address
        linkText.text = kanazawa_url
    }
    
}
