//
//  QuoteViewModel.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import Foundation

import Foundation

final class QuoteViewModel: ObservableObject {
    
    //@Published var quotes = QuotesDataQuery.Data()
    @Published var percentage: Int = 0
    @Published var showingAlert: Bool = false
    @Published var showFinalView: Bool = false
    
//        init() {
//            fetch()
//        }

    
//    func fetch() {
//        Network.shared.apollo.fetch(query: QuotesDataQuery()) { result in
//            switch result {
//                case .success(let graphQLResult):
//                if let quotes = graphQLResult.data {
//                        DispatchQueue.main.async {
//                            self.quotes = quotes
//                            //self.quotes = self.process(data: quotes)
//                        }
//                    }
//                case .failure(let error):
//                    print(error)
//            }
//
//        }
//    }
    
    var myImage: String {
        var image: String = ""
        if self.percentage < 40 {
            image = "Mouchoir"
        } else if self.percentage >= 40 && self.percentage < 80{
            image = "Triste"
        } else {
            image = "Heureux"
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
    }
    
    func percentageToZero(){
     self.percentage = 0
    }

}
