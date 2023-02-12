//
//  CharacterDetailPushCoordinator.swift
//  mvc
//
//  Created by gabatx on 4/1/23.
//

import Foundation
import UIKit

class CharacterDetailPushCoordinator: Coordinator {

    var navigationController: UINavigationController?
    var characterModel: CharacterModel // Necesitamos que nos llegue un characterModel para poder pasarlo a la vista

    // UINavigationController?: Lo coloco opcional para no tener que validar si en nil o no
    init(navigationController: UINavigationController?, characterModel: CharacterModel) {
        self.navigationController = navigationController
        self.characterModel = characterModel
    }

    func start() {
        // Inicializamos el viewController con esta información. De esta manera cuando se presente la view sabrá que datos mostrar
        let characterDetailViewController = CharacterDetailViewController(characterDetailmodel: characterModel)
        // Colocamos en el título del navigationController el nombre del personaje
        self.navigationController?.navigationItem.title = characterModel.name
        // Presentamos desde el viewController donde estamos el detailViewController
        self.navigationController?.pushViewController(characterDetailViewController, animated: true) // Presenta con navigationController
    }
}
