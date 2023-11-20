//
//  UserListUseCase.swift
//  FetchAsync
//
//  Created by Gabriel Zawalski on 20/11/23.
//

import Foundation

class UserListUseCase {
    @Injected(\.networkService) var networkService: NetworkService

    func fetchUsers() async -> [User] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        return await networkService.fetch(url: url).sorted(by: { $0.name < $1.name })
    }
}

// MARK: - Dependency Injection
struct UserListUseCaseKey: InjectionKey {
    static var currentValue: UserListUseCase = UserListUseCase()
}

extension InjectedValues {
    var userListUseCase: UserListUseCase {
//        get { Self[UserListUseCaseKey.self] }
//        set { Self[UserListUseCaseKey.self] = newValue }

        get { UserListUseCaseKey.currentValue }
        set { UserListUseCaseKey.currentValue = newValue }
    }
}
