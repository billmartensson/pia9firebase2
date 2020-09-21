//
//  ViewController.swift
//  pia9firebase2
//
//  Created by Bill Martensson on 2020-09-21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        ref.child("products").child("firstproduct").child("productname").setValue("Skruvmejsel")
        ref.child("products").child("firstproduct").child("color").setValue("Blå")
        ref.child("products/firstproduct/amount").setValue(7)

        let prodName = "secondproduct"
        ref.child("products/\(prodName)/productname").setValue("Hammare")
        
        print("Vår andra produkt är \(prodName) och den är jättebra")
        
        
        print("Nu ska vi hämta data")
        ref.child("products/firstproduct").observeSingleEvent(of: .value, with: { (snapshot) in
          
            let allTheProductInfo = snapshot.value as! NSDictionary
            
            let pname = allTheProductInfo["productname"] as! String
            let pcolor = allTheProductInfo["color"] as! String
            
            
            print("Produkten heter \(pname)")
            print("Färgen är \(pcolor)")

            
          }) { (error) in
            print(error.localizedDescription)
        }
        print("Nu har vi hämtat data")
        
    }


}

