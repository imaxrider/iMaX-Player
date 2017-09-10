//
//  PlayListTableViewController.swift
//  iMaX Player
//
//  Created by SmartTaxi on 3/14/2560 BE.
//  Copyright © 2560 Rachanon Kwampien. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class PlayListTableViewController: UITableViewController {

    var fileNameArr = [String]()
      var filePathArr = [String]()
    var fileArr = [NSURL]()
    var iPlayer:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            print(directoryContents)
            
            // if you want to filter the directory contents you can do like this:
            let playFiles = directoryContents.filter{ $0.pathExtension == "mp4" || $0.pathExtension == "avi" || $0.pathExtension == "m4v"}
            
            //let allFileNames = playFiles.map{ $0.deletingPathExtension().lastPathComponent}
            fileNameArr = playFiles.map{ $0.deletingPathExtension().lastPathComponent}
            filePathArr = playFiles.map{$0.pathExtension}
            
            //let allFileNames = playFiles.map{ $0.pathExtension}
            
            fileArr = playFiles as [NSURL]
            
            print("All File :", fileNameArr)
            print("All urls:",fileArr.count)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fileArr.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlayListCell

        // Configure the cell...
    
       

        let strURlName = "\(self.fileArr[indexPath.row])".components(separatedBy: "/")
        print("URL \(strURlName[11])")
        
        cell.lblInput.text = "\(self.fileNameArr[indexPath.row]).\(self.filePathArr[indexPath.row])"
        //cell.lblInput.text = strURlName[11].replacingOccurrences(of: "%20", with: " ")
        cell.lblHide.text = "\(self.fileArr[indexPath.row])"
        cell.lblHide.isHidden = true
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Select1 \(self.fileArr[(indexPath as NSIndexPath).row])")
    //print("Select2 \(self.fileNameArr[(indexPath as NSIndexPath).row])")
        
        let u = NSURL(string:"\(self.fileArr[(indexPath as NSIndexPath).row])")
        self.iPlayer = AVPlayer(url: u! as URL)
        let iPlayerController = AVPlayerViewController()
        
        iPlayerController.player = iPlayer
        present(iPlayerController, animated: true, completion: {
            self.iPlayer.play()
        })
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
