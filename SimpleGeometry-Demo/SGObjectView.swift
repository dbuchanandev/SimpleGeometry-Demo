//
//  SGObjectView.swift
//  SimpleGeometry-Demo
//
//  Created by Donavon Buchanan on 10/12/20.
//

import SimpleGeometry
import SwiftUI

struct SGObjectView: View {
    // MARK: Private
    /*
     Create a @StateObject of type IndentifiableRect to hold all the
     properties needed for the .readFrame modifier
     */
    @StateObject
    private var viewSize = SGObject()
    
    @StateObject
    private var parentViewSize = SGObject()

    // MARK: Internal
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // X Axis
            VStack(alignment: .leading) {
                Text("minX: \(viewSize.rect.minX)")
                Text("midX: \(viewSize.rect.midX)")
                Text("maxX: \(viewSize.rect.maxX)")
            }

            // Y Axis
            VStack(alignment: .leading) {
                Text("minY: \(viewSize.rect.minY)")
                Text("midY: \(viewSize.rect.midY)")
                Text("maxY: \(viewSize.rect.maxY)")
            }

            // VStack Size
            VStack(alignment: .leading) {
                Text("Contents Width: \(viewSize.rect.width)")
                Text("Contents Height: \(viewSize.rect.height)")
            }

            // Full View Size
            VStack(alignment: .leading) {
                Text("Full Width: \(parentViewSize.rect.width)")
                Text("Full Height: \(parentViewSize.rect.height)")
            }
        }
        .font(.system(.body, design: .monospaced))
        // Blue border for illustration. This is the size being read.
        .border(Color.blue, width: 2)
        // Read size for contents of the VStack, filling the view
        .readSize(to: viewSize)
        // Read full size of the containing view
        .readParentSize(to: parentViewSize)
    }
}

struct SGObjectView_Previews: PreviewProvider {
    static var previews: some View {
        SGObjectView()
    }
}
