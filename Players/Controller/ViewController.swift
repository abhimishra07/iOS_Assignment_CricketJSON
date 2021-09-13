//
//  ViewController.swift
//  Players
//
//  Created by Anu on 02/09/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tableView: UITableView!
    
    let PLAYER_URL = "http://test.oye.direct/players.json"
    var countryDataModel = [String: [PlayerModel]]()
    var counrties = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        tableView.delegate = self
        tableView.dataSource = self
        getPlayerData(url : PLAYER_URL)
    }
    
//Write the getPlayerData method here:
    
    func getPlayerData (url : String) {
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
               print("sucess got player data")
                
                let playerJSON : JSON = JSON(response.result.value!)
                self.parseData(json: playerJSON)
                self.tableView.reloadData()
            }
            else{
                print("Error\(response.result.error)")
            }
        }
    }
    
 // Parse The JSON
    func parseData(json : JSON) {
        if let result = json.dictionary  {
            
            for (country,_) in result {
                self.counrties.append(country)
                guard let playersDetail = result[country]?.array  else {
                    print("error")
                    return
                }
                
                var playerArray = [PlayerModel]()
                for player in playersDetail {
                    let playerName = player["name"].stringValue
                    let isCaptain = player["captain"].boolValue
                    let playerModel = PlayerModel(name: playerName, isCaptian: isCaptain)
                    playerArray.append(playerModel)
                }
                
                countryDataModel[country] = playerArray
                
            }
        }
    }

    // Table view Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDataModel.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let conutries = Array(countryDataModel.keys)
        cell.textLabel?.text = conutries[indexPath.row]
        return cell
    }
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    
    guard let playerlist = countryDataModel[counrties[indexPath.row]] else {
        return
    }
    //let sb = storyboard?.instantiateViewController(withIdentifier: "PlayerView") as! PlayerViewController
   // sb.playersList = playerlist
    //present(sb, animated: true)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "PlayerView") as! PlayerViewController
     vc.playersList = playerlist
     navigationController?.pushViewController(vc,
     animated: true)
    
    
   }

}

