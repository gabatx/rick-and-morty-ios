//
//  CharacterListView.swift
//  mvc
//
//  Created by gabatx on 2/1/23.
//

import Foundation
import UIKit
// Creamos la vista CharacterListView que contiene la vista UITableView como propiedad
class CharacterListView: UIView {

    let characterTableView: UITableView = {
        let tableView = UITableView() // Creamos una instancia de UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false // La ponemos a false para poder añadir constraint por código
        // Debemos registrar en el tableView la celda para representar los datos
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }() // Esto es para que se ejecute la función inmediatamente

    // Este inicializador sirve para crear la vista desde código
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView() // Llamamos a la función que añade la tabla a la vista
    }

    // required init?(coder: NSCoder) sirve para crear la vista desde un storyboard. Es necesario implementarlo aunque no lo usemos en cada vista
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(characterTableView) // Añadimos la tabla a la vista
        // Vamos a añadir contraint en el top, trailing, bottom y leading. Haremos que tenga las mismas contraint que la vista del ViewController
        NSLayoutConstraint.activate([
            characterTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterTableView.topAnchor.constraint(equalTo: topAnchor),
            characterTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
