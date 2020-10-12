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
    private var vStackSG = SGObject(behavior: .fill)

    /*
     Similar to the above, create a @StateObject of type IndentifiableRect
     to hold all the properties needed for the .readFrame modifier, this
     time using the default initializer values.
     */
    @StateObject
    private var filledViewSG = SGObject()

    // MARK: Internal
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // X Axis
            VStack(alignment: .leading) {
                Text("minX: \(vStackSG.rect.minX)")
                Text("midX: \(vStackSG.rect.midX)")
                Text("maxX: \(vStackSG.rect.maxX)")
            }

            // Y Axis
            VStack(alignment: .leading) {
                Text("minY: \(vStackSG.rect.minY)")
                Text("midY: \(vStackSG.rect.midY)")
                Text("maxY: \(vStackSG.rect.maxY)")
            }

            // VStack Size
            VStack(alignment: .leading) {
                Text("Contents Width: \(vStackSG.rect.width)")
                Text("Contents Height: \(vStackSG.rect.height)")
            }

            // Full View Size
            VStack(alignment: .leading) {
                Text("Full Width: \(filledViewSG.rect.width)")
                Text("Full Height: \(filledViewSG.rect.height)")
            }
        }
        .font(.system(.body, design: .monospaced))
        // Blue border for illustration. This is the size being read.
        .border(Color.blue, width: 2)
        // Read size for contents of the VStack, filling the view
        .readFrame(to: vStackSG)
        // Red border for illustratrion. This is the size of the filled view.
        .border(Color.red, width: 2)
        // Read the size of the previously filled view
        .readFrame(to: filledViewSG)
    }
}

struct SGObjectView_Previews: PreviewProvider {
    static var previews: some View {
        SGObjectView()
    }
}
