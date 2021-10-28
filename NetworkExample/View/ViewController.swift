//
//  ViewController.swift
//  NetworkExample
//
//  Created by ycsong on 2021/06/28.
//

import UIKit
import Log

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Request.getData(term: "bts", country: "us") { (response) in
            switch response {
            case .success(let data):
                Log.d(data)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func downloadTest() {
        let url = URL(string: "http://kumon-kyowondown.ktcdn.co.kr/kumon_mobile/echo/kumonwd/dev/teacher/193_20.11_%EA%B0%80%ED%8F%89%EC%9E%84%EC%A7%81%EC%9B%90%ED%8A%B9%EA%B0%80_%EC%97%B0%EC%88%98%EC%9B%90%EC%9A%B4%EC%98%81%ED%8C%80_20211018100527_20211026190202.pdf")
        FileDownloader.loadFileAsync(url: url!) { (path, error) in
            print("PDF File downloaded to : \(path!)")
        }
    }
}
