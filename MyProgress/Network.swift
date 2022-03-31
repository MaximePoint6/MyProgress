//
//  Network.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

    let url = "https://demotivation-quotes-api.herokuapp.com/" // Udapte this link with your API link

    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}
