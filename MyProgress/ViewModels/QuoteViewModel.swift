//
//  QuoteViewModel.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import Foundation

import Foundation

final class QuoteViewModel: ObservableObject {
    
    @Published var quotes: [Quotes.Quote] = []
    @Published var percentage: Int = 0
    @Published var showingAlert: Bool = false
    @Published var showFinalView: Bool = false
    var index: Int = 0
    var quotesCount: Int = 0
    @Published var quote: Quotes.Quote?
    
    init() {
        fetch()
    }
    
    func process(data: QuoteData) -> [Quotes.Quote] {
        return Quotes(data).quotes
    }
    
    func fetch() {
        Network.shared.apollo.fetch(query: QuotesDataQuery()) { result in // Change the query name to your query name
            switch result {
            case .success(let graphQLResult):
                if let quotes = graphQLResult.data {
                    print("Success! Result: \(graphQLResult)")
                    self.quotes = self.process(data: quotes)
                    self.quotesCount = self.quotes.count
                    self.quote = self.quotes[self.index]
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors \(errors)")
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    var author: String {
        guard let author = quote?.author else {
            return ""
        }
        return author
    }
    
    var currentQuote: String {
        guard let currentQuote = quote?.quote else {
            return ""
        }
        return currentQuote
    }
    
    
    var myImage: String {
        var image: String = ""
        if self.percentage < 40 {
            image = "smiley_sick"
        } else if self.percentage >= 40 && self.percentage < 80{
            image = "smiley_meh"
        } else {
            image = "smiley_awe"
        }
        return image
    }
    
    func nextQuote(){
        // fetch()
        if self.percentage == 40 {
            self.percentage += 10
            self.showingAlert = true
        } else if percentage <= 90 {
            self.percentage += 10
        } else if percentage == 100  {
            self.showFinalView = true
        }
        
        if self.index < (quotesCount-1) {
            self.index += 1
        } else {
            self.index = 0
        }
        
        self.quote = self.quotes[self.index]
    }
    
    func percentageToZero(){
        self.percentage = 0
    }
    
}
