//
//  Api.swift
//  Pods
//
//  Created by Admin on 15/02/2017.
//
//

import Foundation
import SwiftyJSON
import Alamofire

public class Api{
    public static func getTweetsArray(searchPhrase: String, completion: @escaping ((Bool, [String]?, String?)->Void)){
        
        let urlString = "https://api.twitter.com/1.1/search/tweets.json?q=" + searchPhrase + "&result_type=recent"
        let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request(url!, headers: ["Authorization":"Bearer AAAAAAAAAAAAAAAAAAAAABjczAAAAAAAmpsyum03hAwA3jfPdbcpIrWLwXY%3Dg5wRYqAQUdGvCiPYoWV6vAsJ5ELWctM37PDkaAFXeX1NOFgn8Y"])
            .responseJSON { (response) in
                if response.result.isSuccess{
                    let json = JSON(response.result.value)
                    let tweetsArray = json["statuses"].arrayValue
                    var result = [String]()
                    for tweet in tweetsArray{
                        result.append(tweet["text"].stringValue)
                    }
                    completion(true, result, nil)
                } else{
                    completion(false, nil, "error")
                }
        }
    }
}
