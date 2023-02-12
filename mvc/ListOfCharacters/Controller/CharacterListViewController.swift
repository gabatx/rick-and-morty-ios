//
//  CharacterListViewController.swift
//  mvc
//
//  Created by gabatx on 1/1/23.

import UIKit

class CharacterListViewController: UIViewController {

    // Creamos las dos propiedades que necesitaremos para poder hablar con la vista y con el modelo
    var mainView: CharacterListView { self.view as! CharacterListView }
    let apiClients = ListOfCharactersAPIClient()
    // Creamos una propiedad para poder crear el dataSource. El dataSource es el que se encarga de representar los datos que le pasemos
    private var tableViewDataSource: ListOfCharacterTableViewDataSource?
    private var tableViewDataDelegate: ListOfCharacterTableViewDelegate?

    // Creamos una referencia al coordinator:
    var characterDetailCoordinator: CharacterDetailPushCoordinator?
    //var characterDetailCoordinator: CharacterDetailModalCoordinator?

    // Primero cargaremos la vista y cuando esta se haya cargado entonces lanzamos la petición http. Para ello nos
    // apoyamos en el loadView para crear la instancia de CharacterListView
    override func loadView() {
        // Decimos que view es igual a la vista CharacterListView para que se cargue la vista que queramos.
        view = CharacterListView()
        // Instanciamos el dataSource y el delegate:
        tableViewDataDelegate = ListOfCharacterTableViewDelegate()
        tableViewDataSource = ListOfCharacterTableViewDataSource(tableView: mainView.characterTableView)  // Le pasamos al inicializador el tableView de la vista que lo contiene.
        // Todos los tableView tienen un dataSource y un delegate. El dataSource es el que se encarga de representar los datos. El delegate es el que se encarga de gestionar los eventos de la vista
        // Le indicamos que será nuestras clases las que se encargarán de representar los datos y de gestionar los eventos
        mainView.characterTableView.dataSource = tableViewDataSource
        mainView.characterTableView.delegate = tableViewDataDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Este viewController será el mediador, el que se encargará de presentar la información del personaje

        // Cada vez que se pulse en una celda accedemos este closure de ListOfCharacterTableViewDelegate.
        // Esto pasa porque el delegate es un objeto que se encarga de gestionar los eventos de la vista, vista que
        // se vuelve a cargar como si fuera la primera vez que se carga, por eso está en el viewDidLoad.
        tableViewDataDelegate?.didTapOnCell = { [weak self] index in
            // Comprobamos que existe el tableViewDataSource. Se hace con guard para ahorrar validar el nil en cada linea
            guard let dataSource = self?.tableViewDataSource else { return }
            // Obtenemos el modelo a partir del array que tenemos en el dataSource
            let characterModel = dataSource.characters[index]

            self?.characterDetailCoordinator = CharacterDetailPushCoordinator(navigationController: self?.navigationController, characterModel: characterModel)
            // self?.characterDetailCoordinator = CharacterDetailModalCoordinator(viewController: self, characterModel: characterModel)

            self?.characterDetailCoordinator?.start()
        }

        // Cuando la vista se haya cargado entonces ahora hacemos la petición http.
        Task {
            let characters =  await apiClients.getListOfCharacters()
            // Le pasamos al dataSource la información recogida. Lo hacemos mediante el set
            tableViewDataSource?.setCharacters(characters: characters.results)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        // Introducir el título del navigation controller
        navigationItem.title = "Characters"
    }

}

