//
//  TestingView.swift
//  SimpleGeometry-Demo
//
//  Created by Donavon Buchanan on 10/13/20.
//

import SwiftUI
import SimpleGeometry

struct TestingView: View {
    @StateObject
    private var lazyVStack = SGObject(behavior: .fill)
    @StateObject
    private var lazyVStackContainer = SGObject()
    
    @StateObject
    private var lazyHStack = SGObject(behavior: .fill)
    @StateObject
    private var lazyHStackContainer = SGObject()
    
    @StateObject
    private var lazyVGrid = SGObject(behavior: .fill)
    @StateObject
    private var lazyVGridContainer = SGObject()
    let grid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        Form {
            Section(header: Text("LazyVStack")) {
                LazyVStack {
                    Text("Test Text")
                    Text("Size: \(lazyVStack.rect.width.toString) x \(lazyVStack.rect.height.toString)")
                    Text("Container: \(lazyVStackContainer.rect.width.toString) x \(lazyVStackContainer.rect.height.toString)")
                }
                .readSize(to: lazyVStack)
                .padding()
                .readParentSize(to: lazyVStackContainer)
            }
            
            Section(header: Text("LazyHStack")) {
                LazyHStack {
                    VStack {
                        Text("Test Text")
                        Text("Size: \(lazyHStack.rect.width.toString) x \(lazyHStack.rect.height.toString)")
                        Text("Container: \(lazyHStackContainer.rect.width.toString) x \(lazyHStackContainer.rect.height.toString)")
                    }
                }
                .readSize(to: lazyHStack)
                .padding()
                .readParentSize(to: lazyHStackContainer)
            }
            
            Section(header: Text("LazyVGrid")) {
                LazyVGrid(columns: grid) {
                    Text("Test Text")
                    Text("Size: \(lazyVGrid.rect.width.toString) x \(lazyVGrid.rect.height.toString)")
                    Text("Container: \(lazyVGridContainer.rect.width.toString) x \(lazyVGridContainer.rect.height.toString)")
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(.green)
                }
                .readSize(to: lazyVGrid)
                .padding()
                .readParentSize(to: lazyVGridContainer)
            }
        }
    }
}

fileprivate extension CGFloat {
    var toString: String {
        return String(format: "%.2f", self)
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
