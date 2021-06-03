//
//  AnimateSplash.swift
//  Ketchum
//
//  Created by Vivian Nguyen on 6/2/21.
//

import Foundation
import SwiftUI


struct Welcome: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            Color.white
            Image("pokeball")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: animate ? .fill : .fit)
                .frame(width: animate ? nil : 100, height: animate ? nil : 100)
                
                .scaleEffect(animate ? 3 : 1)
                .frame(width: UIScreen.main.bounds.width)
                
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear(perform: {animateSplash()})
        .opacity(endSplash ? 0 : 1)
    }
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { withAnimation(Animation.easeOut(duration: 1)){
                animate.toggle()
            }
        
        withAnimation(Animation.linear(duration: 0.8)){
                endSplash.toggle()
            }
        }
    }
}


