//
//  Carousel.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 05.01.2023.
//
import UIKit
//import SDWebImage


final class Carousel: UIView {
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CarouselLayout()
    )
    var images: [UIImage?] = []
    
    var urls: [URL] = []
    var selectedIndex: Int = 0
    private var timer: Timer?
    
    public init(frame: CGRect, images: [UIImage?]) {
        self.images = images
        super.init(frame: frame)
        setupView()
    }
    
    // init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // init from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = false
        collectionView.isPagingEnabled = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        scheduleTimerIfNeeded()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    private func scheduleTimerIfNeeded() {
        guard images.count > 1 else { return }
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            withTimeInterval: 3.0,
            repeats: true,
            block: { [weak self] _ in
                self?.selectNext()
            }
        )
    }
    
    private func selectNext() {
        selectItem(at: selectedIndex + 1)
    }
    
    private func selectItem(at index: Int) {
        let index = images.count > index ? index : 0
        guard selectedIndex != index else { return }
        selectedIndex = index
        collectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension Carousel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView: UIImageView = UIImageView(frame: .zero )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = images[indexPath.row]
        
//        sd_setImage(with: urls[indexPath.row], placeholderImage: UIImage(named: "placeholder"))
        
        cell.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: cell.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor)
        ])
        return cell
    }
}

extension Carousel: UICollectionViewDelegate {}
