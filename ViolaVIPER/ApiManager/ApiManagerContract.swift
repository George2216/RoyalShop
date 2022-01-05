//
//  ApiManagerContract.swift
//  ViolaVIPER
//
//  Created by George on 24.12.2021.
//

import Foundation

enum Method:String {
case GET
case POST
}

enum RequestsErrors:Error {
case invalideURLString
case serverOutputError
case typecastError
}


protocol ApiManagerContract {
    func sendRequest<Output:Codable>(type:Output.Type ,method:Method,
                                     requestType:Requests, data:Data?,
                                     complition:
                                     @escaping((Output?,RequestsErrors?)->()))
}
