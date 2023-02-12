//
//  CharacterDetailView.swift
//  mvc
//
//  Created by gabatx on 3/1/23.
//

import Foundation
import UIKit
import Kingfisher

class CharacterDetailView: UIView {

    var characterImageViewDetail: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let characterNameDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    let characterStatusDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    let characterSpecieDetail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView(){
        addSubview(characterImageViewDetail)
        addSubview(characterNameDetail)
        addSubview(characterStatusDetail)
        addSubview(characterSpecieDetail)

        NSLayoutConstraint.activate([
            characterImageViewDetail.leadingAnchor.constraint(equalTo:leadingAnchor,constant:12),
            characterImageViewDetail.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor,constant:12), // También con layoutMarginsGuide
            characterImageViewDetail.heightAnchor.constraint(equalTo:characterImageViewDetail.widthAnchor,multiplier: 3/4),
            characterImageViewDetail.heightAnchor.constraint(equalToConstant:150),

            characterNameDetail.leadingAnchor.constraint(equalTo:characterImageViewDetail.trailingAnchor,constant:20),
            characterNameDetail.topAnchor.constraint(equalTo:characterImageViewDetail.topAnchor),
            characterNameDetail.trailingAnchor.constraint(equalTo:trailingAnchor,constant:-12),

            characterStatusDetail.leadingAnchor.constraint(equalTo:characterNameDetail.leadingAnchor),
            characterStatusDetail.topAnchor.constraint(equalTo:characterNameDetail.bottomAnchor,constant:8),
            characterStatusDetail.trailingAnchor.constraint(equalTo:trailingAnchor,constant:-12),

            characterSpecieDetail.leadingAnchor.constraint(equalTo:characterNameDetail.leadingAnchor),
            characterSpecieDetail.topAnchor.constraint(equalTo:characterStatusDetail.bottomAnchor,constant:8),
            characterSpecieDetail.trailingAnchor.constraint(equalTo:trailingAnchor,constant:-12),
        ])
    }

    func configure(model: CharacterModel){
        // Si el teléfono está en modo oscuro o claro, se cambia el color de fondo
        backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
        characterImageViewDetail.kf.setImage(with: URL(string: model.image))
        characterNameDetail.text = model.name
        characterStatusDetail.text = model.status
        characterSpecieDetail.text = model.species
    }

}
