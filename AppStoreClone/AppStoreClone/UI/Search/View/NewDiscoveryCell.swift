//
//  NewDiscoveryCell.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import UIKit

final class NewDiscoveryCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let magnifyglassImageView: UIImageView = {
        let image = UIImage(systemName: "magnifyingglass")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private func setUI() {
        [magnifyglassImageView, titleLabel].forEach {
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            magnifyglassImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            magnifyglassImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            magnifyglassImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            magnifyglassImageView.widthAnchor.constraint(equalTo: magnifyglassImageView.heightAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: magnifyglassImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with model: SearchNewDiscoveryModel) {
        titleLabel.text = model.title
    }
}
