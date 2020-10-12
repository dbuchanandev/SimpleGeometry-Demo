//
//  ContentView.swift
//  SimpleGeometry-Demo
//
//  Created by Donavon Buchanan on 10/7/20.
//

import SimpleGeometry
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SGObjectView()
                .tabItem {
                    Label(
                        "SGObject Info",
                        systemImage: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left"
                    )
                }

            List(0 ..< 1000) { index in
                MinYCell(index: index)
            }
            .tabItem {
                Label("minY List", systemImage: "list.triangle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
