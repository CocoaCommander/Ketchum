//
//  Comparison.swift
//  Ketchum
//
//  Created by Justin Lim on 6/3/21.
//

import SwiftUI

struct Comparison: View {
    @State var pokemon1 : Datum
    @State var pokemon2 : Datum
    var body: some View {
        VStack {
            Text("Comparison")
            HStack {
                VStack {
                    Text(pokemon1.name!)
//                    Image(pokemon1.images)
                }
                VStack {
                    //Second Pokemon
                }
            }
        }
    }
}
