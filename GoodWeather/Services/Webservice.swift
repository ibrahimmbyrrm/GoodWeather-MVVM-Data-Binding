//
//  Webservice.swift
//  GoodWeather
//
//  Created by İbrahim Bayram on 24.05.2023.
//

import Foundation

struct Resource<T> {
    let url : URL
    let parse : (Data) -> T?
}

final class Webservice {
    
    func load<T>(resource : Resource<T>, completed: @escaping(T?) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                completed(resource.parse(data))
            }else {
                completed(nil)
            }
        }.resume()
    }
    
}
