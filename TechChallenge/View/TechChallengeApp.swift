//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView(object: Coordinator())
        }
    }
}

