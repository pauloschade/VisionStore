//
//  NavigationLink.swift
//  my-first-app
//
//  Created by Paulo Tech on 27/05/24.
//
import Foundation
import SwiftUI

enum LinkState {
    case active
    case normal
    case special
}

struct CustomNavigationLinkView<Value: Hashable>: View {
    var text: String
    var state: LinkState?
    var value: Value

    @State private var isHovered = false

    var body: some View {
            NavigationLink(value: value) {
                HStack {
                    Text(text)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Circle()
                        .fill(circleColor)
                        .frame(width: 10, height: 10)
                        .padding(.trailing, 10)
                }
                .background(Color(UIColor.systemBackground))
            }
        .buttonStyle(PlainButtonStyle())  // Ensures the NavigationLink behaves like a button but without default styling
    }

    private var circleColor: Color {
        switch state {
        case .active:
            return Color.green
        case .special:
            return Color.yellow
        default:
            return Color.gray
            
        }
    }
}

struct CustomNavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                CustomNavigationLinkView(text: "Active Link", state: .active, value: 1)
                CustomNavigationLinkView(text: "Normal Link", state: .normal, value: 3)
                CustomNavigationLinkView(text: "Special Link", state: .special,  value: 2)
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}
