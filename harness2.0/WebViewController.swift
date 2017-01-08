//
//  WebViewController.swift
//  harness2.0
//
//  Created by Mir Ali on 3/15/16.
//  Copyright © 2016 Herban. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var container:UIView!

    var webView:WKWebView!
    var indexPath:Int!
    var bannerImg:UIImage!
    
    var sites:[String] = ["https://en.wikipedia.org/wiki/Wind_power", "https://en.wikipedia.org/wiki/Geothermal_energy", "https://en.wikipedia.org/wiki/Hydroelectricity", "https://en.wikipedia.org/wiki/Nuclear_power", "https://en.wikipedia.org/wiki/Solar_power", "https://en.wikipedia.org/wiki/Biomass", "https://en.wikipedia.org/wiki/Natural_gas", "https://en.wikipedia.org/wiki/Coal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        webView = WKWebView()
        container.addSubview(webView)

    }


    override func viewDidAppear(_ animated: Bool) {
        let frame = CGRect(x: 0, y: 0, width: container.bounds.width, height: container.bounds.height)
        webView.frame = frame
        
        loadRequest(sites[indexPath])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as? InfoViewController
        svc?.indexPath = indexPath
        svc?.bannerImg = bannerImg
    }
    
    func loadRequest(_ urlStr:String) {
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
