//
//  ListOfCharacterTableViewDataSource.swift
//  mvc
//
//  Created by gabatx on 2/1/23.
//
import Foundation
import UIKit
// Clase que se va a encargar de representar los datos que hemos recibido de la petición http.
// Por cada elemento del array pintaremos una celda
class ListOfCharacterTableViewDataSource: NSObject, UITableViewDataSource {
    // Cogemos una referencia de la vista que hemos creado en CharacterListView que se la acabermos pasando desde el controlador
    private let tableView: UITableView
    // Los personajes, es el modelo que va a representar dentro de la TableView.
    // private(set): solo se pueda modificar desde dentro de la estructura creada entre llaves
    private(set) var characters: [CharacterModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // Inicializador para poderlo crear desde el controlador
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Recuperamos una celda de la tableView
        let cell: CharacterListCellView = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as! CharacterListCellView
        // Recuperamos que personaje debemos mostrar en esa celda
        let character = characters[indexPath.row]
        cell.configure(character)

        return cell
    }

    // Creamos un método para setear los personajes
    func setCharacters(characters: [CharacterModel]){
        self.characters = characters
    }
}
