//
//  ContentView.swift
//  Rings_Animation
//
//  Created by Maxim Macari on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State var showing = false
    
    var body: some View {
        
        VStack{
           
            
            ProgressRingModel(fgColor: Color.red, bgColor: Color.red, showing: false, thickness: 10, width: 100, height: 100, progress: 10)
            
            Spacer()
            
            MultiColorProgressRing(percent: 40)
            
            Spacer()
            
            ProgressView(speed: 3.6, isLoading: false, colour: Color.black, size: 100)
            
            Spacer()
            
            CircularSliderModal(size: 100, progress: 100, thickness: 10)
            
            Spacer()
                
        }
        
        
            
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
