//
//  ViewController.swift
//  MyKanazawa
//
//  Created by 杉山悠己 on 2021/10/22.
//

import UIKit

struct facilitiesJson: Codable {
    let name: String?
    let address: String?
    let url: URL?
//    let latitude: Float?
//    let longitude: Float?
}

struct ResultJson: Codable {
    let facilities:[facilitiesJson]?
}

class ViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        guard let req_url = URL(string: "https://infra-api.city.kanazawa.ishikawa.jp/v1/facilities/search.json?lang=ja&count=10") else {
            return
        }
        
        print(req_url)
        
        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: req, completionHandler: {
            (data , response , error) in
            
            print("data: \(String(describing: data))")
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            
            session.finishTasksAndInvalidate()
            
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data!)
//                print(json)
                
                if let items = json.facilities {
                    self.KanazawaList.removeAll()
                    for facilities in items {
                        if let name = facilities.name,
                           let address = facilities.address,
                           let url = facilities.url
//                           let latitude = facilities.latitude,
//                           let longitude = facilities.longitude
                        
                        {
//                            let kanazawa = (name,address,url,latitude,longitude)
                            let kanazawa = (name,address,url)
                            self.KanazawaList.append(kanazawa)
                        }
                    }
                    
                    self.tableView.reloadData()
                    
                    if let kanazawadbg = self.KanazawaList.first {
                        print("##################################################")
                        print("kanazawaList[0] = \(kanazawadbg)")
                        print("##################################################")
                    }
                }
                
            } catch {
                print("エラーが出ました")
            }
        })
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return KanazawaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kanazawaCell", for: indexPath)
        
        cell.textLabel?.text = KanazawaList[indexPath.row].name
        
        return cell
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
//    var KanazawaList : [(name:String, address:String, url:URL, latitude:Float, longitude:Float)] = []
    var KanazawaList : [(name:String, address:String, url:URL)] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destination = segue.destination as? DetailViewController else {
                    fatalError("Failed")
                }
               
                destination.kanazawa_name = KanazawaList[indexPath.row].name
                destination.kanazawa_address = KanazawaList[indexPath.row].address
                let reurl = KanazawaList[indexPath.row].url.absoluteString
                destination.kanazawa_url = reurl
                
            }
        }
    }
}
