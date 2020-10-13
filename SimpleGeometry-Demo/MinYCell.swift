//
//  MinYCell.swift
//  SimpleGeometry-Demo
//
//  Created by Donavon Buchanan on 10/12/20.
//

import SimpleGeometry
import SwiftUI

struct MinYCell: View {
    @StateObject
    private var sgObject = SGObject()

    let index: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("Cell #\(index)")
                .bold()

            Text("minY: \(sgObject.rect.minY)")
        }
        .readSize(to: sgObject)
    }
}

struct MinYCellView_Previews: PreviewProvider {
    static var previews: some View {
        MinYCell(index: 0)
    }
}
