//
//  ViewController.swift
//  ShopifyStore
//
//  Created by Skyclones on 24/06/21.
//

import UIKit
import MobileBuySDK

class ViewController: UIViewController {
    
    let shopDomain = "YOUR STORE NAME"
    let apiKey     = "YOUR STORE KEY"
    
    let locale   = Locale(identifier: "en-US")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let client: Graph.Client = Graph.Client(shopDomain: shopDomain, apiKey: apiKey, locale: locale)
        client.cachePolicy = .cacheFirst(expireIn: 3600)
        
        
        let query = Storefront.buildQuery { $0
            
            .shop { $0
                .name()
            }
            
        }
        let task = client.queryGraphWith(query) { response, error in
            if let response = response {
                print(response);
            }else {
                print("Query failed: \(error)")
            }
        }
        task.resume()
    }
    

}

