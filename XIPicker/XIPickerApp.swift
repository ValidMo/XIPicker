//
//  XIPickerApp.swift
//  XIPicker
//
//  Created by Valid Mohammadi on 10.12.2023.
//

import SwiftUI
import Firebase


@main
struct XIPickerApp: App {
    

    init(){
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    
    var body: some Scene {
        WindowGroup {
           RootView()
        }
    }
}
