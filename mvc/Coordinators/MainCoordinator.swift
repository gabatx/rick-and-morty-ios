//
//  MainCoordinator.swift
//  mvc
//
//  Created by gabatx on 4/1/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?

    // Crearemos un inicializador que le inyectamos un navigationController
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController

    }

    // Es el que va a lanzar la navegación
    func start() {
        // Si tuviéramos storyBoard sería así:
        // let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        // let viewController = storyBoard.instantiateViewController(withIdentifier: "CharacterListViewController")
        // viewController.title = "Characters"
        // navigationController?.pushViewController(viewController, animated: true)
        // Una vez realizado nos hiríamos al storyBoard y asignaríamos el identificador en el inpector de identidad "StoryBoard ID"

        let viewController = CharacterListViewController() // <===== Aquí asignamos el viewController inicial
        viewController.title = "Characters"
        navigationController?.pushViewController(viewController, animated: true)
    }
}
