//
//  CardInfoNav.swift
//  Ketchum
//
//  Created by stlp on 6/8/21.
//

import SwiftUI

struct CardInfoNav: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                label: {
                    /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                })
        }
    }
}

struct CardInfoNav_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoNav()
    }
}
