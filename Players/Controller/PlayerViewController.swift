//
//  PlayerViewController.swift
//  Players
//
//  Created by Anu on 07/09/21.
//

import UIKit

class PlayerViewController: UITableViewController {

    @IBOutlet var myPlayerView: UITableView!
    var player = PlayerModel()
    
    var playersList = [PlayerModel]()
     var names = [String]()
    var captain = [Bool]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in playersList {
            var playerName = i.name
            //print(playerName)
            self.names.append(playerName)
        }
        
        for i in playersList {
            var Captain = i.isCaptian
            self.captain.append(Captain)
        }
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playersList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
        // Configure the cell...
        let playersData = names[indexPath.row]
  //      print(playersData)
        //print(playerName)
        cell.textLabel?.text = playersData
        
        let myCaptain = captain[indexPath.row]
        if myCaptain == true {
        
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.green
            cell.backgroundView = bgColorView
        }
    
        return cell
    }
    

}
