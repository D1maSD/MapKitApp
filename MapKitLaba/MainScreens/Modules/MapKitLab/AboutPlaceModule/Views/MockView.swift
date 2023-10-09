//
//  File.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 18.01.2023.
//


import UIKit
import SnapKit
import LIHImageSlider

final class AboutPlaceCellView: UIViewController {
    lazy var view0: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemTeal
        view.image = UIImage(named: "cover1")
        let label = UILabel()
        label.text = "Page 0"
        label.textAlignment = .center
        return view
    }()
    
    lazy var view1: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemPink
        view.image = UIImage(named: "cover2")
        let label = UILabel()
        label.text = "Page 1"
        label.textAlignment = .center
        return view
    }()
    
    lazy var view2: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow
        view.image = UIImage(named: "cover3")
        let label = UILabel()
        label.text = "Page 2"
        label.textAlignment = .center
        return view
    }()
    
    lazy var views = [view0, view1, view2]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: 150)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 150)
            
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    
    
    var images = [UIImage?]() {
        didSet {
            print(images.count)
        }
    }
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoadObject()
        configureTableView()
        
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.scrollView.snp.centerX)
            $0.bottom.equalTo(self.scrollView.snp.bottom).offset(-12)
            $0.left.equalTo(self.scrollView.snp.left)
            $0.right.equalTo(self.scrollView.snp.right)
            $0.height.equalTo(50)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    var lunacharskiyImages: [UIImage?] = [
        UIImage(named: "lun1"),
        UIImage(named: "lun2"),
        UIImage(named: "lun3"),
        UIImage(named: "lun4"),
        UIImage(named: "lun5"),
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    // MARK: - Other Methods
    
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterAboutPlaceProtocol?
    
    private var tableView = UITableView()
    static var typeOf = Int()
    
}

extension AboutPlaceCellView: PresenterToViewAboutPlaceProtocol{
    // TODO: Implement View Output Methods
    func showImages(_ images: [UIImage?]) {
        self.images = images
        
    }
    
    func showObject(_ object: Object) {
        
    }
}


extension AboutPlaceCellView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AboutPlaceCell.self, forCellReuseIdentifier: "\(AboutPlaceCell.self)")
        
        setupTableViewLayout()
        setupCollectionLayout()
    }
    
    
    func setupCollectionLayout() {
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(150)
            $0.left.equalTo(self.view.snp.left)
            $0.right.equalTo(self.view.snp.right)
            $0.bottom.equalTo(self.view.snp.bottom)
        }
    }
    
    func setupTableViewLayout() {
        
    }
}


extension AboutPlaceCellView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: AboutPlaceCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
}








final class ThirdViewController: UIViewController {
    
    lazy var view0: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemTeal
        view.image = UIImage(named: "cover1")
        let label = UILabel()
        label.text = "Page 0"
        label.textAlignment = .center
        return view
    }()
    
    lazy var view1: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemPink
        view.image = UIImage(named: "cover2")
        let label = UILabel()
        label.text = "Page 1"
        label.textAlignment = .center
        return view
    }()
    
    lazy var view2: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow
        view.image = UIImage(named: "cover3")
        let label = UILabel()
        label.text = "Page 2"
        label.textAlignment = .center
        return view
    }()
    
    lazy var views = [view0, view1, view2]
    
    lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: 150)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 150)
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        imageScrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageScrollView)
        imageScrollView.edgeToTo(view: view)
        
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.imageScrollView.snp.centerX)
            $0.bottom.equalTo(self.imageScrollView.snp.bottom).offset(-12)
            $0.left.equalTo(self.imageScrollView.snp.left)
            $0.right.equalTo(self.imageScrollView.snp.right)
            $0.height.equalTo(50)
        }
    }
}

extension ThirdViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
