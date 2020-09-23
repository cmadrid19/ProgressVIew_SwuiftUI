//
//  Ring_Model.swift
//  Rings_Animation
//
//  Created by Maxim Macari on 23/09/2020.
//

import SwiftUI

struct ProgressRingModel: View {
    
    @State var fgColor: Color = Color.orange
    @State var bgColor: Color = Color.gray
    @State var showing: Bool = false
    @State var thickness: CGFloat = 10
    @State var width: Int = 100
    @State var height: Int = 100
    @State var progress: Int = 50
    
    
    var body: some View {
        VStack{
            
            ZStack{
                Circle()
                    .stroke(self.bgColor, style: StrokeStyle(lineWidth: self.thickness))
                    .frame(width: CGFloat(self.width), height: CGFloat(self.height))
                    .opacity(0.10)
                
                Circle()
                    .trim(from: self.showing ? CGFloat((self.progress/100)) : 0.99 , to: 1) // 1 es nada, 0 es todo
                    .stroke(self.fgColor, style: StrokeStyle(lineWidth: self.thickness, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(Angle(degrees: 180),axis: (x: 1, y: 0, z: 0))
                    .frame(width: CGFloat(self.width), height: CGFloat(self.height))
                    .animation(.easeOut)
                    
                
                Text(String(self.progress) + "%")
                    .font(.title)
                    .bold()
            }
            .onTapGesture{
                self.showing.toggle()
            }
            
           
            
            
        }
    }
}

struct Ring_Model_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRingModel(fgColor: Color.orange, bgColor: Color.gray, showing: false, thickness: 10, width: 100, height: 100, progress: 40)
    }
}
