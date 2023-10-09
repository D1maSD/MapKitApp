//
//  CurrentNewsViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 28.10.2022.
//  
//

import UIKit
import SnapKit

final class CurrentNewsViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupLayout()
        presenter?.viewDidLoadDetail()
        setupUI()
    }
    
    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let newsImageContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 340).isActive = true
        return view
    }()
    private let titleTextContentView: UIView = {
        let view = UIView()
        return view
    }()
    private let buttonsContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // MARK: - Properties
    var presenter: ViewToPresenterCurrentNewsProtocol?
    
    private var newsImageView = UIImageView()
    private var newsTitle = UILabel()
    private var newsText = UILabel()
    private var likeButton = NewsButton()
    private var dislikeButton = NewsButton()
    private var starButton = NewsButton()
    private var commentButton = NewsButton()
    private var shareButton = NewsButton()
    private var likeCount = 1
    private var currentLikes = Int()
    
    private var config = UIButton.Configuration.bordered()

    func setupNavigationController() {
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "share"),
                style: .done,
                target: self,
                action: nil
            ),
            
            UIBarButtonItem(
                image: UIImage(named: "smile"),
                style: .done,
                target: self,
                action: #selector(likeTapped)
            ),
            
            UIBarButtonItem(
                image: UIImage(named: "message"),
                style: .done,
                target: self,
                action: nil
            )
        ]
    }
    
    @objc func likeTapped() {
        if (likeCount % 2) != 0 {
            likeCount += 1
            currentLikes += 1
            likeButton.setTitle(String(currentLikes), for: .normal)
        } else {
            likeCount -= 1
            currentLikes -= 1
            likeButton.setTitle(String(currentLikes), for: .normal)
        }
    }
    func setupUI() {
        
        self.view.backgroundColor = .white
        
        shareButton.backgroundColor = .systemGray
        dislikeButton.backgroundColor = .systemGray
        starButton.backgroundColor = .systemGray
        commentButton.backgroundColor = .systemGray
        
        likeButton.backgroundColor = .systemGray
        likeButton.layer.masksToBounds = true
        likeButton.layer.cornerRadius = 5
        likeButton.setImage(UIImage(named: "smile"), for: .normal)
        
        likeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        dislikeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        starButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        commentButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        likeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        
        dislikeButton.setImage(UIImage(named: "face-sad"), for: .normal)
        starButton.setImage(UIImage(named: "star"), for: .normal)
        
        commentButton.setImage(UIImage(named: "message"), for: .normal)
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        
        newsTitle.font = .systemFont35Heavy
        newsTitle.numberOfLines = 6

        newsText.font = .text18SemiboldFont
        newsText.numberOfLines = 50
        
        scrollView.isScrollEnabled = true
    }
    
    func setupLayout() {
        
        addSubview()
               
        self.newsImageView.layer.cornerRadius = 12

        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addArrangedSubview(newsImageContentView)
        scrollViewContainer.addArrangedSubview(titleTextContentView)
        scrollViewContainer.addArrangedSubview(buttonsContentView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        newsImageView.snp.makeConstraints {
            $0.left.equalTo(newsImageContentView.snp.left).offset(20)
            $0.right.equalTo(newsImageContentView.snp.right).offset(-20)
            $0.top.equalTo(newsImageContentView.snp.top).offset(20)
            $0.height.equalTo(self.view.frame.width - 80)
        }
        newsTitle.snp.makeConstraints {
            $0.left.equalTo(titleTextContentView.snp.left).offset(20)
            $0.right.equalTo(titleTextContentView.snp.right).offset(-20)
            $0.top.equalTo(titleTextContentView.snp.top).offset(10)
        }
        newsText.snp.makeConstraints {
            $0.left.equalTo(titleTextContentView.snp.left).offset(20)
            $0.right.equalTo(titleTextContentView.snp.right).offset(-20)
            $0.top.equalTo(newsTitle.snp.bottom).offset(20)
            $0.bottom.equalTo(titleTextContentView.snp.bottom).offset(-20)
        }
        //MARK: BUTTONS
        starButton.snp.makeConstraints {
            $0.centerX.equalTo(buttonsContentView.snp.centerX)
            $0.bottom.equalTo(buttonsContentView.snp.bottom).offset(-20)
            $0.top.equalTo(buttonsContentView.snp.top).offset(20)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        likeButton.snp.makeConstraints {
            $0.right.equalTo(dislikeButton.snp.left).offset(-9)
            $0.centerY.equalTo(starButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        dislikeButton.snp.makeConstraints {
            $0.right.equalTo(starButton.snp.left).offset(-9)
            $0.centerY.equalTo(starButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        commentButton.snp.makeConstraints {
            $0.left.equalTo(starButton.snp.right).offset(9)
            $0.centerY.equalTo(starButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
        shareButton.snp.makeConstraints {
            $0.left.equalTo(commentButton.snp.right).offset(9)
            $0.centerY.equalTo(starButton.snp.centerY)
            $0.width.equalTo((self.view.frame.width - 54) / 5)
            $0.height.equalTo(50)
        }
    }
    
    private func addSubview() {

        newsImageContentView.addSubview(newsImageView)
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleTextContentView.addSubview(newsTitle)
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        
        titleTextContentView.addSubview(newsText)
        newsText.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsContentView.addSubview(likeButton)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsContentView.addSubview(dislikeButton)
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsContentView.addSubview(starButton)
        starButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsContentView.addSubview(commentButton)
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonsContentView.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CurrentNewsViewController: PresenterToViewCurrentNewsProtocol {
    // TODO: Implement View Output Methods
    
    func showNote(_ note: NewsItem) {
        currentLikes = note.likes
        self.newsTitle.text = note.title
        self.newsText.text = note.info
        self.newsImageView.image = note.image
        self.likeButton.setTitle(String(currentLikes), for: .normal)
        self.dislikeButton.setTitle(String(note.dislikes), for: .normal)
        self.starButton.setTitle(String(note.stars), for: .normal)
        print("SHOWNOTE() CurrentNewsViewController NOTE.TITLE \(String(describing: note.title))")
    }
    
}


final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(redView)
        scrollViewContainer.addArrangedSubview(blueView)
        scrollViewContainer.addArrangedSubview(greenView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 10

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        view.backgroundColor = .red
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.backgroundColor = .blue
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1200).isActive = true
        view.backgroundColor = .green
        return view
    }()
}











