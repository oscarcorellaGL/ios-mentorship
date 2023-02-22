//
//  NetworkError.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import Foundation


public enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    }
  }
}
