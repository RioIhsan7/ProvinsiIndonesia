//
//  DetailViewController.swift
//  ProvinsIndonesia
//
//  Created by FatahKhair on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var gubernur: UILabel!
    @IBOutlet weak var tahun: UILabel!
    @IBOutlet weak var ibukota: UILabel!
    @IBOutlet weak var senjata: UILabel!
    
    var passID:String?
    var passNama:String?
    var passGubernur:String?
    var passTahun:String?
    var passKota:String?
    var passSenjata:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = passID!
        nama.text = passNama!
        gubernur.text = passGubernur!
        tahun.text = passTahun!
        ibukota.text = passKota!
        senjata.text = passSenjata!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
