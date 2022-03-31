//
//  Quotes.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import Foundation

struct Quote: Identifiable, Decodable {
        var id: String
        var quote: String
        var author: String
}
