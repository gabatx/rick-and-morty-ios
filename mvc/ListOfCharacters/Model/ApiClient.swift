//
//  ApiClient.swift
//  mvc
//
//  Created by gabatx on 2/1/23.
//
import Foundation

final class ListOfCharactersAPIClient {

    func getListOfCharacters() async ->  CharacterModelResponse {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data) // Modelo
    }

}
