//
//  Router.swift
//  SampleApp
//
//  Created by ycsong on 2021/10/27.
//

import Alamofire
import Foundation

enum Router: URLRequestConvertible {
    
    case search(entity: String, term: String, country: String)
    
    // MARK: - HTTP Method
    private var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .search(let entity, let term, let country):
            return ["entity": entity, "term": term, "country": country]
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.baseUrl.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // http method
        urlRequest.httpMethod = self.method.rawValue
        
        // header
        urlRequest.setValue(Constant.ContentType.json.rawValue, forHTTPHeaderField: Constant.HeaderFiled.contentType.rawValue)
        
        // body
        if let parameters = parameters {
            do {
                switch self.method {
                case .get:
                    if let url = urlRequest.url?.absoluteString,
                        var urlComponent = URLComponents(string: url) {
                        urlComponent.queryItems = parameters.map { (key, value) in
                            URLQueryItem(name: key, value: value as? String)
                        }
                        urlRequest.url = urlComponent.url
                    }
                default:
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                }
            } catch {
                throw AFError.parameterEncoderFailed(reason: .encoderFailed(error: error))
            }
        }
        
        print("ycsong: requestUrl = \(urlRequest.url?.absoluteString ?? "")")
        return urlRequest
    }
}
