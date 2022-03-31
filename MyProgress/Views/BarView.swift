//
//  BarView.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import SwiftUI

struct BarView: View {
    
    @EnvironmentObject var viewModel: QuoteViewModel
    
    var body: some View {
        VStack (alignment: .trailing){
            HStack(alignment: .center){
                ZStack (alignment: .leading){
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width-50, height: 8)
                        .cornerRadius(12)
                        .foregroundColor(.gray).opacity(0.2)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width-50)/100*CGFloat(viewModel.percentage), height: 14)
                        .cornerRadius(10)
                        .foregroundColor(Color("FlashyOrange"))
                    Circle()
                        .frame(width: 12, height: 12)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                        .foregroundColor(.white)
                        .alignmentGuide(.leading) { _ in CGFloat(UIScreen.main.bounds.width-50)/100*CGFloat(-viewModel.percentage)+6}
                }
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
            }
            Text("10 citations")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    
    @StateObject static var quoteViewModel = QuoteViewModel()
    
    static var previews: some View {
        BarView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(quoteViewModel)
    }
}
