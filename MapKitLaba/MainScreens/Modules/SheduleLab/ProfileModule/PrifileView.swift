//
//  PrifileView.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 16.11.2022.
//

import UIKit

protocol AddPhotoViewDelegate: AnyObject {
    func editButtonTapped()
}

final class ProfileView: UIView {

    // MARK: - Properties
    let imageView = UIImageView()

    weak var delegate: AddPhotoViewDelegate?

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        setupConstraints()
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2.4
    }

    // MARK: - Public function
    public func setImage(_ image: UIImage?) {

        self.imageView.image = image
    }

    // MARK: - Module function
    private func setupViews() {
        addSubview(imageView)
    }

    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }

    // MARK: - Actions
    @objc private func editButtonTapped() {
        delegate?.editButtonTapped()
    }
}
