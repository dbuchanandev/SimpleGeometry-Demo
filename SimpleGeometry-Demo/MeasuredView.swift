//
//  MeasuredView.swift
//  SimpleGeometry-Demo
//
//  Created by Donavon Buchanan on 10/12/20.
//

import SimpleGeometry
import SwiftUI

struct MeasuredView: View {
    // MARK: Private
    /*
     Create a @StateObject of type IndentifiableRect to hold all the
     properties needed for the .readFrame modifier
     */
    @StateObject
    private var viewSize = SGObject()
    
    @State
    private var parentViewSize = CGSize()

    // MARK: Internal
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // X Axis
            VStack(alignment: .leading) {
                Text("minX: \(viewSize.minX)")
                Text("midX: \(viewSize.midX)")
                Text("maxX: \(viewSize.maxX)")
            }

            // Y Axis
            VStack(alignment: .leading) {
                Text("minY: \(viewSize.minY)")
                Text("midY: \(viewSize.midY)")
                Text("maxY: \(viewSize.maxY)")
            }

            // VStack Size
            VStack(alignment: .leading) {
                Text("Contents Width: \(viewSize.width)")
                Text("Contents Height: \(viewSize.height)")
            }

            // Full View Size
            VStack(alignment: .leading) {
                Text("Full Width: \(parentViewSize.width)")
                Text("Full Height: \(parentViewSize.height)")
            }
        }
        .font(.system(.body, design: .monospaced))
        // Blue border for illustration. This is the size being read.
        .border(Color.blue, width: 2)
        // Read size for contents of the VStack, filling the view
        .readSize(to: viewSize)
        // Read full size of the containing view
        .measureContainingView(to: $parentViewSize)
    }
}

struct SGObjectView_Previews: PreviewProvider {
    static var previews: some View {
        MeasuredView()
    }
}
