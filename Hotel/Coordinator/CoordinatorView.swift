//
//  CoordinatorView.swift
//  Hotel
//
//  Created by Алексей Баранов on 12.09.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.getPage(page: MyPages.hotel)
                .navigationDestination(for: MyPages.self) { page in
                    coordinator.getPage(page: page)
                        .toolbarRole(.editor)
                }
        }
        .environmentObject(coordinator)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
