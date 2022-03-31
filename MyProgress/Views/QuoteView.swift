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
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3*2)
            VStack {
                Text("Auteur")
                    .padding(10)
                    .font(.system(size: 40))
                    .font(.title)
                    .foregroundColor(.white)
                Text("Citation")
                    .padding(.bottom)
                    .font(.headline)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                Image(viewModel.myImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                HStack (alignment: .bottom){
                    Text("\(viewModel.percentage) %")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Gray"))
                    Text("des citations")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Gray"))
                }.padding()
                VStack (alignment: .leading){
                    Text("Votre progression")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Gray"))
                        .padding(5)
                    VStack (alignment: .trailing){
                        HStack(alignment: .center){
                            ZStack (alignment: .leading){
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width-50, height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(.gray).opacity(0.2)
                                Rectangle()
                                    .frame(width: (UIScreen.main.bounds.width-50)/100*CGFloat(viewModel.percentage), height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(Color("Orange"))
                            }
                            Image(systemName: "star.fill")
                                .foregroundColor(.blue)
                            
                        }
                        Text("10 citations")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }.padding(.bottom, 20)
                Button {
                    viewModel.nextQuote()
                } label: {
                    Text(viewModel.percentage == 100 ? "FINIR" : "CITATION SUIVANTE")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(Color("Pink"))
                        .clipShape(Capsule())
                }.padding()
                    .alert("Tu es à 50 % des citations", isPresented: $viewModel.showingAlert) {
                        Button("Arrêter") {
                            viewModel.percentageToZero()
                            viewModel.showFinalView.toggle()
                        }
                        Button("Continuer") { }
                    }.sheet(isPresented: $viewModel.showFinalView) {
                        FinalView()
                }
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
            .environmentObject(quoteViewModel)
    }
}
