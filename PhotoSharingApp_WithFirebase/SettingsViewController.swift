//
//  SettingsViewController.swift
//  PhotoSharingApp_WithFirebase
//
//  Created by Serhat on 26.06.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cikisYapTiklandi(_ sender: Any) {
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
}
