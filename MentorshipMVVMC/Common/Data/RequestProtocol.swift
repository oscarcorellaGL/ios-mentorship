//
//  RequestProtocol.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import Foundation

protocol RequestProtocol {
    
  var path: String { get }
  var requestType: RequestType { get }
    
}

enum RequestType: String {
  case GET
  case POST
}

extension RequestProtocol {
  
    var host: String {
        "https://pokeapi.co/api/v2/"
    }
    func createURLRequest() throws -> URLRequest {
        let url = URL(string: host+path)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = requestType.rawValue
        urlRequest.setValue("application/json",
        forHTTPHeaderField: "Content-Type")

        return urlRequest
    }
        
  
}
