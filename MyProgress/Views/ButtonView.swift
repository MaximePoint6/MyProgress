//
//  ButtonView.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject var viewModel: QuoteViewModel
    
    var body: some View {
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
        }.alert("Tu es à 50 % des citations", isPresented: $viewModel.showingAlert) {
            Button("Arrêter") {
                viewModel.percentageToZero()
                viewModel.showFinalView.toggle()
            }
            Button("Continuer") { }
        }.sheet(isPresented: $viewModel.showFinalView) {
            FinalView()
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    
    @StateObject static var quoteViewModel = QuoteViewModel()
    
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
            .environmentObject(quoteViewModel)
            .padding()
    }
}
