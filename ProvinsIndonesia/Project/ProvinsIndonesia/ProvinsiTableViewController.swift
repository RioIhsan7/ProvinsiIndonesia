//
//  ProvinsiTableViewController.swift
//  ProvinsIndonesia
//
//  Created by FatahKhair on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProvinsiTableViewController: UITableViewController {
    var idSelected:String?
    var namaSelected:String?
    var gubernurSelected:String?
    var ibukotaSelected:String?
    var senjataSelected:String?
    var tahunSelected:String?
    
    var provinsi = [Provinsi]()
    var arr = [[String: AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/ProvinsiServer/index.php/Api/getProvinsi").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arr = resData as! [[String:AnyObject]]
                }
                if self.arr.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
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
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "provinsi", for: indexPath) as! ProvinsiTableViewCell

        // Configure the cell...
        var dict = arr[indexPath.row]
        cell.nama.text = dict["nama_provinsi"] as? String
        cell.gubernur.text = dict["gubernur"] as? String

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    print("Row \(indexPath.row)selected")
    
    let task = arr[indexPath.row]
    idSelected = task["id_provinsi"] as? String
    namaSelected = task["nama_provinsi"] as? String
    gubernurSelected = task["gubernur"] as? String
    tahunSelected = task["tahun_berdiri"] as? String
    ibukotaSelected = task["ibukota"] as? String
    senjataSelected = task["senjata_tradisional"] as? String
    
    performSegue(withIdentifier: "passProvinsi", sender: self)
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "passProvinsi"{
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! DetailViewController
            let value = arr[indexPath.row]
            controller.passID = value["id_provinsi"] as? String
            controller.passNama = value["nama_provinsi"] as? String
            controller.passGubernur = value["gubernur"] as? String
            controller.passTahun = value["tahun_berdiri"] as? String
            controller.passKota = value["ibukota"] as? String
            controller.passSenjata = value["senjata_tradisional"] as? String
            }
        }
    }
}


