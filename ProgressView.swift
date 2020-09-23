//
//  ProgressView.swift
//  Rings_Animation
//
//  Created by Maxim Macari on 23/09/2020.
//

import SwiftUI

struct ProgressView: View {
    
    @State var speed: Double = 3.6
    @State var isLoading = false
    @State var colour: Color = Color.red
    @State var size: CGFloat = 100
    
    var body: some View {
        
        ZStack{
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .butt, dash: [26]))
                .frame(width: self.size, height: self.size, alignment: .center)
                .foregroundColor(self.colour)
                .onAppear() {
                    
                    withAnimation(
                        Animation
                            .linear(duration: self.speed)
                            .repeatForever(autoreverses: false)
                    ){
                        
                        self.isLoading.toggle()
                        
                    }
                    
                }.rotationEffect(Angle(degrees: isLoading ? 0 : 360))
            
            Text("Loading...")
                .foregroundColor(self.colour)
            
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(speed: 3.6, isLoading: false, colour: Color.red,size: 100)
    }
}
