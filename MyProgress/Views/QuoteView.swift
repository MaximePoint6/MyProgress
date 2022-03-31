//
//  QuoteView.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import SwiftUI

struct QuoteView: View {
    
    @EnvironmentObject var viewModel: QuoteViewModel
    
    var body: some View {
        ZStack (alignment: .bottom){
            Rectangle()
                .cornerRadius(25)
                .foregroundColor(Color.white)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/5*3)
            Image(viewModel.myImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .alignmentGuide(.bottom) { _ in CGFloat(UIScreen.main.bounds.height/5*3+70)}
            VStack {
                Text(viewModel.author)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .font(.system(size: 38))
                    .font(.title)
                    .foregroundColor(.white)
                Text(viewModel.currentQuote)
                    .padding()
                    .font(.headline)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Rectangle()
                    .frame(height: UIScreen.main.bounds.height/5*1)
                    .foregroundColor(.clear)
                HStack (alignment: .bottom){
                    Text("\(viewModel.percentage) %")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Gray"))
                    Text("des citations")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Gray"))
                }.padding()
                VStack (alignment: .leading){
                    Text("Votre progression")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Gray"))
                        .padding(5)
                    Text("\(viewModel.percentage) %")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color("FlashyOrange"))
                        .clipShape(Capsule())
//                        .alignmentGuide(.leading) { _ in CGFloat(UIScreen.main.bounds.width-50)/100*CGFloat(-viewModel.percentage)+15}
                        BarView()
                }.padding(.bottom, 20)
                ButtonView()
                Spacer()
            }
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color("Orange"), Color("Yellow")]), startPoint: .topLeading, endPoint: .topTrailing).ignoresSafeArea()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @StateObject static var quoteViewModel = QuoteViewModel()
    
    static var previews: some View {
        QuoteView()
            .previewDevice("iPhone 13")
            .environmentObject(quoteViewModel)
    }
}
