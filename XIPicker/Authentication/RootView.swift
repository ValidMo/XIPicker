//
//  RootView.swift
//  XIPicker
//
//  Created by Valid Mohammadi on 11.12.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack{
            AuthenticationView()
        }
    }
}

#Preview {
    RootView()
}
