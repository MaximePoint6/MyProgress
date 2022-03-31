//
//  MyProgressApp.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import SwiftUI

@main
struct MyProgressApp: App {
    
    @StateObject var quoteViewModel = QuoteViewModel()
    
    var body: some Scene {
        WindowGroup {
            QuoteView()
                .environmentObject(quoteViewModel)
        }
    }
}
