//
//  CharacterListCellView.swift
//  mvc
//
//  Created by gabatx on 2/1/23.
//
import Foundation
import UIKit
import Kingfisher

class CharacterListCellView: UITableViewCell {
    // Se está creando una instancia de tipo UIIMageView en donde seguidamente modificamos sus propiedades y la devolvemos como resultado
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }() // = { }(): Esto es para que se ejecute la función inmediatamente

    let characterName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let characterStatus: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let characterSpecie: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // required init?(coder: NSCoder) sirve para crear la vista desde un storyboard. Es necesario implementarlo aunque no lo usemos en cada vista
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Init que va a lanzar la función que pintará la vista
        setupView()
    }

    func setupView() {
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(characterSpecie)

        NSLayoutConstraint.activate([
            //
            characterImageView.leadingAnchor.constraint(equalTo:leadingAnchor,constant:12),
            characterImageView.topAnchor.constraint(equalTo:topAnchor,constant:12),
            characterImageView.heightAnchor.constraint(equalTo:characterImageView.widthAnchor,multiplier: 3/4),
            characterImageView.heightAnchor.constraint(equalToConstant:80),


            characterName.leadingAnchor.constraint(equalTo:characterImageView.trailingAnchor,constant:20),
            characterName.topAnchor.constraint(equalTo:characterImageView.topAnchor),
            characterName.trailingAnchor.constraint(equalTo:trailingAnchor,constant:-12),
            
            characterStatus.leadingAnchor.constraint(equalTo:characterName.leadingAnchor),
            characterStatus.topAnchor.constraint(equalTo:characterName.bottomAnchor,constant:8),
            characterStatus.trailingAnchor.constraint(equalTo:trailingAnchor,constant:-12),

            characterSpecie.leadingAnchor.constraint(equalTo:characterName.leadingAnchor),
            characterSpecie.topAnchor.constraint(equalTo:characterStatus.bottomAnchor,constant:8),
            characterSpecie.trailingAnchor.constraint(equalTo:trailingAnchor,constant:-12),
        ])
    }

    func configure(_ model: CharacterModel){
        characterName.text = model.name
        characterStatus.text = model.species
        characterSpecie.text = model.status
        characterImageView.kf.setImage(with: URL(string: model.image))
    }
}
