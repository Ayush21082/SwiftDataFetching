//
//  ViewController.swift
//  SwiftDataFetching
//
//  Created by EDUMVA4 on 20/07/19.
//  Copyright © 2019 Kreative Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
    }

    func getData()
    {
        

        guard let url = URL(string: "http://localhost:8080/samplephp/getdata.php")
            
            else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
                
            }

            if let data = data {
                print(data)
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    struct outp: Decodable {
                        let username: URL
      

         
                        enum CodingKeys : String, CodingKey {
                            case username = "username"
                    

                        }
                    }
                    
                    guard let output = try? JSONDecoder().decode(outp.self, from: data) else {
                        print("Error: Couldn't decode data into Blog")

                        return
                    }
                    // Printing Value of Response
                    print("Username: \(output.username)")
                  
                } catch {
                    print(error)
                    
                }
                
            }
            }.resume()
        
    }
}

