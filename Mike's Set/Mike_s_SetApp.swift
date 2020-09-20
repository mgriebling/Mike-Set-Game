//
//  Mike_s_SetApp.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-19.
//

import SwiftUI

@main
struct Mike_s_SetApp: App {
    var body: some Scene {
        WindowGroup {
            SetGameView(viewModel: Shape3SetGame())
        }
    }
}
