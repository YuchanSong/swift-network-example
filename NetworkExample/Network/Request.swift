//
//  Request.swift
//  SampleApp
//
//  Created by ycsong on 2021/10/25.
//

import Alamofire

class Request {
    static let shared = Request()
    private init() {}
    
    static func getData(entitiy: String = "musicVideo", term: String, country: String, completion: @escaping (Result<Search, AFError>) -> ()) {
        self.request(route: Router.search(entity: entitiy, term: term, country: country), completion: completion)
    }
    
    private static func request<T>(route: Router, completion: @escaping (Result<T, AFError>) -> Void) where T: Decodable {
        AF.request(route)
            .responseDecodable { (response) in
                completion(response.result)
            }
    }
}
