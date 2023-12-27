//
//  DavalebaSwiftUI9App.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/27/23.
//

import SwiftUI

@main
struct DavalebaSwiftUI9App: App {
    var body: some Scene {
        WindowGroup {
            NewsPageView(viewModel: NewsPageViewModel())
        }
    }
}
