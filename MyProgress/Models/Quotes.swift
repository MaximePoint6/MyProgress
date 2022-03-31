//
//  Quotes.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import Foundation

typealias QuoteData = QuotesDataQuery.Data

struct Quotes: Decodable {
    var quotes: [Quote]

    init(_ quotes: QuoteData?) {
        self.quotes = quotes?.quotes.map({ quote -> Quote in
            Quote(quote)
        }) ?? []
    }

    struct Quote: Identifiable, Decodable {
        var id: String
        var quote: String
        var author: String

        init(_ quote: QuoteData.Quote) {
            self.id = quote.id
            self.quote = quote.quote
            self.author = quote.author
        }
    }
}
