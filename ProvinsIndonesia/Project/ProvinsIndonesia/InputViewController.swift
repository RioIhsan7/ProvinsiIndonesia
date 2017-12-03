//
//  InputViewController.swift
//  ProvinsIndonesia
//
//  Created by FatahKhair on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class InputViewController: UIViewController {
    @IBOutlet weak var etNama: UITextField!
    @IBOutlet weak var etGubernur: UITextField!
    @IBOutlet weak var etTahun: UITextField!
    @IBOutlet weak var etKota: UITextField!
    @IBOutlet weak var etSenjata: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Simpan(_ sender: Any) {
        let nNama = etNama.text!
        let nGubernur = etGubernur.text!
        let nTahun = etTahun.text!
        let nKota = etKota.text!
        let nWeapon = etSenjata.text!
        
        if ((nNama.isEmpty) || (nGubernur.isEmpty) || (nTahun.isEmpty) || (nKota.isEmpty) || (nWeapon.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let params = ["nama_provinsi": nNama, "gubernur": nGubernur, "tahun_berdiri": nTahun, "ibukota": nKota, "senjata_tradisional": nWeapon]
            print(params)
            
            let url = "http://localhost/ProvinsiServer/index.php/Api/daftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data berhasil disimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                    
                }
                
            })
        }
    }
}



