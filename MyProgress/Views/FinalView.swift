//
//  FinalView.swift
//  MyProgress
//
//  Created by Maxime Point on 31/03/2022.
//

import SwiftUI

struct FinalView: View {
    
    @EnvironmentObject var viewModel: QuoteViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            viewModel.percentageToZero()
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Jeu terminé, on recommence ?")
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(Color("Pink"))
                .clipShape(Capsule())
        })
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
