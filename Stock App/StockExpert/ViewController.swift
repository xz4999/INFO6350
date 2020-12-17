//
//  ViewController.swift
//  StockExpert
//
//  Created by xz4999 on 10/26/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    let apiKey = "11991e52aaf61ac716fdf6fcb17b9050"
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    @IBOutlet weak var lblCEOName: UILabel!
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

    @IBAction func getStockValue(_ sender: Any) {
        guard let stockName = txtStockName.text else { return }
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
    
        getStockValue(stockURL: url, stockName: stockName)
    }
    
    func getStockValue(stockURL: String!, stockName: String!) {
        SwiftSpinner.show("Getting Stock value for \(stockName)")
        Alamofire.request(stockURL).responseJSON { (response) in
            SwiftSpinner.hide()
            if response.result.isSuccess{
                guard let jsonString = response.result.value else { return }
                guard let stockJSON: [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 {return}
                guard let price = stockJSON[0]["price"].double else { return }
                guard let ceoName = stockJSON[0]["ceo"].rawString() else { return }
 
                self.lblCEOName.text = "\(ceoName)"
                self.lblStockPrice.text = "\(price)"
            }
        }
    }
    
}

