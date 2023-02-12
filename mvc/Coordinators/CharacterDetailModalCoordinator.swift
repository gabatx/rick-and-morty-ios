//
//  CharacterDetailModalCoordinator.swift
//  mvc
//
//  Created by gabatx on 4/1/23.
//

import Foundation
import UIKit

class CharacterDetailModalCoordinator: Coordinator {
    var viewController: UIViewController?
    var characterModel: CharacterModel

    init(viewController: UIViewController?, characterModel: CharacterModel){
        self.viewController = viewController
        self.characterModel = characterModel
    }

    func start() {
        // Cojo el modal y lo envío a la vista
        let characterDetailViewController = CharacterDetailViewController(characterDetailmodel: characterModel)
        // Una vez enviado abro la vista
        viewController?.present(characterDetailViewController, animated: true) // Presenta un modal
    }
}
