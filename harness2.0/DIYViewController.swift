//
//  DIYViewController.swift
//  harness2.0
//
//  Created by Mir Ali on 3/12/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit

class DIYViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bannerImage: UIImageView!
    
    var indexPath:Int!
    var bannerImg:UIImage!
    var titleString:String = ""
    var funFacts:[String]!
    
    var wind:[String] = ["","", ""]
    var geothermal:[String] = []
    var hydroelectric:[String] = []
    var nuclear:[String] = []
    var solar:[String] = []
    var biomass:[String] = []
    var naturalGas:[String] = []
    var coal:[String] = []
    
    //var instructables:[Int:[String]]!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Instructable") as? DIYTableViewCell {
            return cell
        } else {
            return DIYTableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//instructables.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //instructables =  [0:wind, 1:geothermal, 2:hydroelectric, 3:nuclear, 4:solar, 5:biomass, 6:naturalGas, 7:coal]
        bannerImage.image = bannerImg
        titleLabel.text = "DIY: \(titleString)"
    }


    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as? InfoViewController
        svc?.bannerImg = bannerImg
        svc?.indexPath = indexPath
        svc?.funFacts = funFacts
        
    }

}
