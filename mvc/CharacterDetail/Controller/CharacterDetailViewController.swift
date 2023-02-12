//
//  CharacterDetailViewController.swift
//  mvc
//
//  Created by gabatx on 3/1/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {

    var mainView: CharacterDetailView { self.view as! CharacterDetailView }

    // Vamos a crear un inicializador que acepte como parámetro un modelo. Este parámetro se lo pasaremos directamente a la vista:
    init(characterDetailmodel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        // De esta manera sabrá como respresentar los datos del characterDetailView en las subvistas que tenemos
        self.mainView.configure(model: characterDetailmodel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Antes de que se cargue 
    override func loadView() {
        super.loadView()
        view = CharacterDetailView()
    }
}
