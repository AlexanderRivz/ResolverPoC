//
//  CatCellView.swift
//  ResolverTestProject
//
//  Created by Alexander Rivera on 19/7/21.
//

import SwiftUI

struct CatCellView: View {
    
    var catBreed: Cat
    
    var body: some View {
        VStack(alignment: .leading) {
            CatCellRow(title: "Breed: ", description: catBreed.breed)
            CatCellRow(title: "Country: ", description: catBreed.country)
            CatCellRow(title: "Origin: ", description: catBreed.origin)
            CatCellRow(title: "Coat: ", description: catBreed.coat)
            CatCellRow(title: "Pattern: ", description: catBreed.pattern)
        }
        .padding()
    }
}

struct CatCellRow: View {
    
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Text(title)
                .frame(width: 100, height: 40, alignment: .center)
            Text(description)
                .frame(height: 40, alignment: .center)
            Spacer()
        }
    }
    
}

struct CatCellView_Previews: PreviewProvider {
    static var previews: some View {
        CatCellView(catBreed: Cat(breed: "Aguacat", country: "El Salvador", origin: "El Salvador", coat: "Short Hair", pattern: "Stripes"))
    }
}
