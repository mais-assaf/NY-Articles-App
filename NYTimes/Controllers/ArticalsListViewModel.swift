//
//  ArticalsListViewModel.swift
//  NYTimes
//
//  Created by Mais Assaf on 5/10/23.
//

import Foundation
import UIKit
import Alamofire

class ArticalsListViewModel {
    
    var articalDescription: String = ""
    var articalInfo: String = ""
    var articalDate: String = ""
    var articalFullDEtails: String = ""
    
    var data: Welcome?
    
    func getAPICall(completionBlock: @escaping (_ success: Bool) -> Void) {
        let requestURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=RKZMRSwuRoy3Vjof3HmoMh9G3e8A6Rif"
        AF.request(requestURL).responseDecodable(of: Welcome.self) { response in
            switch response.result {
            case .success(_):
                self.data = response.value
                completionBlock(true)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
