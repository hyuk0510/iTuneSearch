//
//  iTuneAPIManager.swift
//  iTuneSearch
//
//  Created by 선상혁 on 2023/11/09.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknown
    case statusError
}

class iTuneAPIManager {
    
    static let shared = iTuneAPIManager()
    private init() { }
        
//    let provider = MoyaProvider<iTuneAPI>()
    
    func fetchData() -> Observable<iTuneData> {

        return Observable<iTuneData>.create { value in
            
            let urlString = "https://itunes.apple.com/search?term=todo&country=KR&media=software&lang=ko_KR&limit=10"

            guard let url = URL(string: urlString) else {
                value.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in

                if let _ = error {
                    value.onError(APIError.unknown)
                    print("URL")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("RESPONSE")
                    value.onError(APIError.statusError)
                    return
                }
                
                if let data = data, let appData = try? JSONDecoder().decode(iTuneData.self, from: data) {
                    value.onNext(appData)
                }
                
            }.resume()
            
            return Disposables.create()
        }
    }
    
}
