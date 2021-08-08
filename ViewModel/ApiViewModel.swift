//
//  ApiViewModel.swift
//
//

import Foundation
  

class ApiViewModel: ObservableObject{

    
    func GetMeals(completion: @escaping(_ status : Bool,_ getData : Meals,_ err : String?)->() ){
        
        let headers = [
            "x-rapidapi-key": "f5f79952b2msh3092196cb664eb2p12287djsn9dcccc82fcf8",
            "x-rapidapi-host": "themealdb.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://themealdb.p.rapidapi.com/filter.php?a=Canadian")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
//                let httpResponse = response as? HTTPURLResponse
                print(data!)
                
                let decoder = JSONDecoder()
                
                do {
                    let feed = try decoder.decode(Meals.self, from: data!)
                    print(feed)
                    completion(true, feed , nil)
                }catch{
                    print("error is json")
                }
            }
        })

        dataTask.resume()
        
     
    }
    
    
    func Getlatest(completion: @escaping(_ status : Bool,_ getData : Latest,_ err : String?)->() ){
        
        let headers = [
            "x-rapidapi-key": "f5f79952b2msh3092196cb664eb2p12287djsn9dcccc82fcf8",
            "x-rapidapi-host": "themealdb.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://themealdb.p.rapidapi.com/latest.php")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
                print(data)
                
                let decoder = JSONDecoder()
                
                do {
                    let feed = try decoder.decode(Latest.self, from: data!)
                    print(feed)
                    completion(true, feed , nil)
                }catch{
                    print("error is json")
                }
            }
        })

        dataTask.resume()
        
     
    }
    
    func GetCatergories(completion: @escaping(_ status : Bool,_ getData : Catergories,_ err : String?)->() ){
        
        let headers = [
            "x-rapidapi-key": "f5f79952b2msh3092196cb664eb2p12287djsn9dcccc82fcf8",
            "x-rapidapi-host": "themealdb.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://themealdb.p.rapidapi.com/list.php?c=list")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
                print(data)
                
                let decoder = JSONDecoder()
                
                do {
                    let feed = try decoder.decode(Catergories.self, from: data!)
                    print(feed)
                    completion(true, feed , nil)
                }catch{
                    print("error is json")
                }
            }
        })

        dataTask.resume()
        
     
    }
    
    
}

