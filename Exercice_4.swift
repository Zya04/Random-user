//
//  Exercice_4.swift
//  Semester_6_1
//
//  Created by Emir Azaiez on 19/09/2017.
//  Copyright © 2017 Emir Azaiez. All rights reserved.
//

import Foundation

class ApiManager: NSObject {
    
    let baseURL = "https://api.randomuser.me/"
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                let results = json["results"] as! NSArray
                completion(results[0])
            } catch let error as NSError {
                print(error)
            }
            
        }.resume()
        
    }
    
}