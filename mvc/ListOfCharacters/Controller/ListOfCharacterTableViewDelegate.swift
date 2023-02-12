//
//  ListOfCharacterTableViewDelegate.swift
//  mvc
//
//  Created by gabatx on 2/1/23.
//

import Foundation
import UIKit
/*
 UITableViewDelegate:
 - Define métodos opcionales que le permiten modificar el comportamiento de un objeto UITableView. Ejemplos:
    - Modificar el encabezado o pie de página de una sección de la tabla
    - Modificar la altura de las filas o secciones de la tabla
    - Mostrar un menú contextual cuando se realiza un gesto de desplazamiento con un dedo sobre una fila de la tabla
    - Configurar el comportamiento de selección y destacado de filas y secciones de la tabla
    - Avisar al delegado cuando el usuario realice acciones sobre la tabla, como tocar en una fila o desplazarse por la tabla
 */
class ListOfCharacterTableViewDelegate: NSObject, UITableViewDelegate {

    // Creamos una propiedad pública (tipo closure) para que registre la pulsación. Se encarga de comunicar el controlador con la vista para que cuando se pulse en una celda se pueda acceder a ella desde el controlador.
    var didTapOnCell: ((Int) -> Void)?

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}
