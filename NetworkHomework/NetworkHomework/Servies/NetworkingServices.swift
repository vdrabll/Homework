//
//  NetworkingServices.swift
//  NetworkHomework
//
//  Created by Виктория Федосова on 21.02.2023.
//

import Foundation
import UIKit

class NetworkingServices {
    private var url = URL(string: "https://api.punkapi.com/v2/beers")!
    func getData(complition: @escaping ([BeerModelDTO]) -> Void) {
        let task =  URLSession.shared.dataTask(with: url, completionHandler: {  data, _, error in
            guard data != nil else {
                print(error?.localizedDescription ?? "Fail to get beers info from server!")
                return
            }
            do {
                let usersData = try JSONDecoder().decode([BeerModelDTO].self, from: data!)
                complition(usersData)
            } catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    func getImage(url: String, complition: @escaping (Data) -> Void) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if data != nil, error == nil {
                complition(data!)
            }
        }
        task.resume()
    }
}
