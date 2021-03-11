//
//  ContentView.swift
//  DrawingPencilKit
//
//  Created by Vadiraj Hippargi on 3/10/21.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    
    @Environment(\.undoManager) private var undoManager
    @State private var canwasView = PKCanvasView()
    
    var body: some View {
        VStack(spacing: 10) {
            Button("Clear"){
                canwasView.drawing = PKDrawing()
            }
            Button("Undo"){
                undoManager?.undo()
            }
            Button("Redo"){
                undoManager?.redo()
            }
            
            MyCanvas(canvasView: $canwasView)
        }
    }
}


struct MyCanvas: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
