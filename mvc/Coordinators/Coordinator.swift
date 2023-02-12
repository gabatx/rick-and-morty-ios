//
//  Coordinator.swift
//  mvc
//
//  Created by gabatx on 4/1/23.
//

/*
Realizamos tres coordinators:
 - MainCoordinators: Este coordinator se va a llamar a lanzar la aplicación y así llamar al listado de personajes
 - CharacterDetailModalCoordinator: Será el encargado de realizar un present para poder presentar de forma modal un ViewController
 - CharacterDetailPushCoordinator: Realizará un push para mostrar un vista dentro de un NavigationController
*/

import Foundation
import UIKit

protocol Coordinator {
    // Las hacemos opcionales, para que el tipo que las implemente pueda dar un valor de instancia a un ViewController o a un NavigationController
    var viewController: UIViewController? { get } // Modal - ViewController
    var navigationController: UINavigationController? { get } // Push - NavigationController

    // Método que va lanzar la acción de navegar
    func start()
}

// Damos un valor por defecto a las propiedades:
extension Coordinator{
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
