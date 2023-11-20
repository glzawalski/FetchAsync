//
//  UserListViewModel.swift
//  FetchAsync
//
//  Created by Gabriel Zawalski on 20/11/23.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    @Injected(\.userListUseCase) var useCase: UseCaseProtol

    func fetchData() async {
        let users = await useCase.fetchUsers()
        await MainActor.run {
            self.users = users
        }
    }
}
