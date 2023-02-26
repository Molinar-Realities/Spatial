//
//  EnergyGraphView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/21/23.
//

import SwiftUI

struct EnergyGraphView: View {
    let amplitude: CGFloat = 100
    let frequency: CGFloat = 0.01
    let phaseShift: CGFloat = 0
    let lineWidth: CGFloat = 5
    let strokeColor: Color = .blue
    
    var body: some View {
        Graph {
            Path { path in
                let xOffset = CGFloat(0)
                let yOffset = UIScreen.main.bounds.height / 2
                path.move(to: CGPoint(x: xOffset, y: yOffset))
                
                for angle in stride(from: 0, to: CGFloat.pi * 2, by: 0.01) {
                    let x = xOffset + angle * frequency
                    let y = yOffset - sin(angle + phaseShift) * amplitude // <- Fix the y-offset
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            .stroke(strokeColor, lineWidth: lineWidth)
        }
        .frame(height: 300)
    }
}



struct EnergyGraphView_Previews: PreviewProvider {
    static var previews: some View {
        EnergyGraphView()
    }
}


struct Graph<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.black
            content
        }
        .border(Color.gray, width: 1)
    }
}
