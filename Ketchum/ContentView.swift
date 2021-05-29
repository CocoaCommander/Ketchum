//
//  ContentView.swift
//  Ketchum
//
//  Created by Ryan Lee on 5/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            VStack (spacing: 25) {
                Text("Welcome to")
                    .font(.custom("ExtraLight", size: 24))
                    .scaleEffect(animate ? 3 : 1)
                Image("pokeball")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 100, height: animate ? nil : 100)
                    
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            
                Text("Ketchum")
                    .font(.custom("Bold", size: 30))
                    .fontWeight(.medium)
                    .scaleEffect(animate ? 3 : 1)
                    
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: {animateSplash()})
            .opacity(endSplash ? 0 : 1)
        }
}
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { withAnimation(Animation.easeOut(duration: 1)){
                animate.toggle()
            }
        withAnimation(Animation.linear(duration: 0.8)){
                endSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

