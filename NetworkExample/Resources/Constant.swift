//
//  Contant.swift
//  SampleApp
//
//  Created by ycsong on 2021/10/27.
//

struct Constant {
    static let baseUrl = "https://itunes.apple.com"
    
    enum HeaderFiled: String {
        case contentType = "Content-Type"
    }
    
    enum ContentType: String {
        case json = "application/json"
    }
}
