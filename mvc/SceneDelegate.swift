//
//  SceneDelegate.swift
//  mvc
//
//  Created by gabatx on 1/1/23.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var mainCoordinators: MainCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Realizamos una instancia de UIWindow pasándole la escena en la que estamos
        window = UIWindow(windowScene: windowScene) 
        let navigationController = UINavigationController() // Creamos el navigationController
        // Le pasamos el navigCont a la instancia del mainCoordinator para poder hacer un push
        mainCoordinators = MainCoordinator(navigationController: navigationController)

        window?.rootViewController = navigationController // Asignamos a rooViewController el navigationController
        window?.makeKeyAndVisible() // Sirve para hacer la window visible

        // Ejecutamos la función que inicia el push hacia el navigationController en mainCoordinator
        mainCoordinators?.start()
    }
}

