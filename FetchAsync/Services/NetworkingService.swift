//
//  NetworkingService.swift
//  FetchAsync
//
//  Created by Gabriel Zawalski on 20/11/23.
//

import Foundation

class NetworkService {
    func fetch<Model>(url: URL) async -> [Model] where Model: Decodable {
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([Model].self, from: data)
            return decodedData
        } catch {
            return []
        }
    }
}

// MARK: - Dependency Injection
struct NetworkServiceKey: InjectionKey {
    static var currentValue: NetworkService = NetworkService()
}

extension InjectedValues {
    var networkService: NetworkService {
//        get { Self[NetworkServiceKey.self] }
//        set { Self[NetworkServiceKey.self] = newValue }

        get { NetworkServiceKey.currentValue }
        set { NetworkServiceKey.currentValue = newValue }
    }
}
