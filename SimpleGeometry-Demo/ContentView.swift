//
//  ContentView.swift
//  SimpleGeometry-Demo
//
//  Created by Donavon Buchanan on 10/7/20.
//

import SwiftUI

import SwiftUI
import SimpleGeometry

struct ContentView: View {
    var body: some View {
        VStack {
//            ReadRectView()
            IDRectView()
        }
    }
}

struct ReadRectView: View {
    /*
     Create a @State property of type CGRect initialized to .zero to hold
     the geometry properties read by the .readFrameToRect modifier.
     */
    @State
    private var vStackRect: CGRect = .zero
    
    /*
     As above, create another @State property of type CGRect initialized 
     to .zero to hold the geometry properties read by the .readFrameToRect modifier.
     This value will hold the geometry properties of the fully filled view frame.
     */
    @State
    private var fullViewRect: CGRect = .zero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // X Axis
            VStack(alignment: .leading) {
                Text("minX: \(vStackRect.minX)")
                Text("midX: \(vStackRect.midX)")
                Text("maxX: \(vStackRect.maxX)")
            }
            
            // Y Axis
            VStack(alignment: .leading) {
                Text("minY: \(vStackRect.minY)")
                Text("midY: \(vStackRect.midY)")
                Text("maxY: \(vStackRect.maxY)")
            }
            
            // VStack Size
            VStack(alignment: .leading) {
                Text("Contents Width: \(vStackRect.width)")
                Text("Contents Height: \(vStackRect.height)")
            }
            
            // Full View Size
            VStack(alignment: .leading) {
                Text("Full Width: \(fullViewRect.width)")
                Text("Full Height: \(fullViewRect.height)")
            }
        }
        .font(.system(.body, design: .monospaced))
        // Blue border for illustration. This is the size being read.
        .border(Color.blue, width: 2)
        // Read size for contents of the VStack, filling the view
        .readFrameToRect(to: $vStackRect, in: .global, frameBehavior: .fill)
        // Red border for illustratrion. This is the size of the filled view.
        .border(Color.red, width: 2)
        // Read the size of the previously filled view
        .readFrameToRect(to: $fullViewRect)
    }
}

struct IDRectView: View {
    /*
     Create a @StateObject of type IndentifiableRect to hold all the
     properties needed for the .readFrame modifier
     */
    @StateObject
    private var vStackRect = IdentifiableRect(frameBehavior: .fill)
    
    /*
     Similar to the above, create a @StateObject of type IndentifiableRect
     to hold all the properties needed for the .readFrame modifier, this
     time using the default initializer values.
     */
    @StateObject
    private var fullViewRect = IdentifiableRect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // X Axis
            VStack(alignment: .leading) {
                Text("minX: \(vStackRect.frameRect.minX)")
                Text("midX: \(vStackRect.frameRect.midX)")
                Text("maxX: \(vStackRect.frameRect.maxX)")
            }
            
            // Y Axis
            VStack(alignment: .leading) {
                Text("minY: \(vStackRect.frameRect.minY)")
                Text("midY: \(vStackRect.frameRect.midY)")
                Text("maxY: \(vStackRect.frameRect.maxY)")
            }
            
            // VStack Size
            VStack(alignment: .leading) {
                Text("Contents Width: \(vStackRect.frameRect.width)")
                Text("Contents Height: \(vStackRect.frameRect.height)")
            }
            
            // Full View Size
            VStack(alignment: .leading) {
                Text("Full Width: \(fullViewRect.frameRect.width)")
                Text("Full Height: \(fullViewRect.frameRect.height)")
            }
        }
        .font(.system(.body, design: .monospaced))
        // Blue border for illustration. This is the size being read.
        .border(Color.blue, width: 2)
        // Read size for contents of the VStack, filling the view
        .readFrame(to: vStackRect)
        // Red border for illustratrion. This is the size of the filled view.
        .border(Color.red, width: 2)
        // Read the size of the previously filled view
        .readFrame(to: fullViewRect)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
