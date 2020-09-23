//
//  CircularSliderModal.swift
//  Rings_Animation
//
//  Created by Maxim Macari on 23/09/2020.
//

import SwiftUI

struct CircularSliderModal: View {
    @State var size: CGFloat = 200
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    @State var thickness: CGFloat = 55
    
    var body: some View {
        
        
        VStack{
            
            ZStack{
                
                Circle()
                    .stroke(Color.red, style: StrokeStyle(lineWidth: self.thickness, lineCap: .round, lineJoin: .round))
                    .frame(width: self.size,height: self.size)
                    .opacity(0.3)
                
                
                //Progress
                Circle()
                    .trim(from: 0, to: self.progress)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: self.thickness, lineCap: .round, lineJoin: .round))
                    .frame(width: self.size,height: self.size)
                    .rotationEffect(.init(degrees: -90))
                
                // Inner Finish Curve
                Circle()
                    .fill(Color.green)
                    .frame(width: self.thickness, height: self.thickness)
                    .offset(x: CGFloat(size / 2))
                    .rotationEffect(.init(degrees: -90))
                
                
                //Drag Circle
                Circle()
                    .fill(Color.black)
                    .frame(width: self.thickness, height: self.thickness)
                    .offset(x: CGFloat(size / 2))
                    .rotationEffect(.init(degrees: angle))
                    
                    //Adding gesture
                    .gesture(DragGesture().onChanged(onDrag(value: )))
                    .rotationEffect(.init(degrees: -90))
                
                
                //Sample
                Text(String(format: "%.2f" + " €", self.progress))
                    .font(.body)
                    .fontWeight(.heavy)
                  
                
            }
        }
    }
    func onDrag(value: DragGesture.Value) {
        //Calculating radians
        
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        //Since atan2 will give from -180 to 180...
        //Eliminating drag gesture size
        //size = 55 => Radius = 27.5
        let radians = atan2(vector.dy - (self.thickness * 0.5), vector.dx - (self.thickness * 0.5))
        
        //Converting to angle
        var angle = radians * 180 / .pi
        
        //Simple technique for 0 to 360...
        //eg = 360 - 176 = 184
        if angle < 0{
            angle = 360 + angle
        }
        
        
        withAnimation(Animation.linear(duration: 0.15)) {
            //Progress
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
        
        
    }
    
}

struct CircularSliderModal_Previews: PreviewProvider {
    static var previews: some View {
        WalletCircularSlider(size: 200, progress: 1)
    }
}
