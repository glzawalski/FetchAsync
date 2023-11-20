//
//  ContentView.swift
//  FetchAsync
//
//  Created by Gabriel Zawalski on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: UserListViewModel

    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView(viewModel: UserListViewModel())
}
