//
//  AboutPlaceViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit
import SnapKit
import MapKit


final class AboutPlaceViewController: UIViewController {
    
    private let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.isUserInteractionEnabled = true
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
    
    private let sliderContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return view
    }()
    private let restInfoContentView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        return view
    }()
    
    var images = [UIImage?]() {
        didSet {
            print(images.count)
        }
    }
    
    var presenter: ViewToPresenterAboutPlaceProtocol?
    
    private var placeImage = UIImageView()
    private var pageControllView = UIView()
    private var shortNameOfPlaceLabel = UILabel()
    private var fullNameLabel = UILabel()
    private var lineView = UIView()
    private var viewModel = AboutPlaceCellVeiwModel()
    private var currentIndex = 0
    private var timer: Timer?
    private var rateRoundButton = RoundButton(frame: .zero)
    private lazy var saveButton = RoundButton(frame: .zero)
    private lazy var rateButton = RoundButton(frame: .zero)
    private lazy var writeTipButton = RoundButton(frame: .zero)
    private var saveLabel = UILabel()
    private var rateLabel = UILabel()
    private var writeLabel = UILabel()
    private var separatorView = UIView()
    private var separatorViewTwo = UIView()
    private var separatorViewThree = UIView()
    private var userAnswearLabel = UILabel()
    private var userButton = RoundButton(frame: .zero)
    private var informationLabel = UILabel()
    private var openLabel = UILabel()
    private var timeIcon = UIImageView()
    private var phoneLabel = UILabel()
    private var phoneIcon = UIImageView()
    private var webSiteLabel = UILabel()
    private var webIcon = UIImageView()
    private var miniMapView = MKMapView()
    private var adressLabel = UILabel()
    private var adressIcon = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoadObject()
        setUpLayout()
        setupUI()
        

        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.imageScrollView.snp.centerX)
            $0.bottom.equalTo(self.imageScrollView.snp.bottom).offset(-12)
            $0.left.equalTo(self.imageScrollView.snp.left)
            $0.right.equalTo(self.imageScrollView.snp.right)
            $0.height.equalTo(50)
        }
    }
    
    private lazy var view0 = UIImageView()
    private lazy var view1 = UIImageView()
    private lazy var view2 = UIImageView()

    private lazy var views = [view0, view1, view2]
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: 150)
//        scrollView.backgroundColor = .clear
        view0.image = UIImage(systemName: "lun1")
        view1.image = UIImage(systemName: "lun1")
        view2.image = UIImage(systemName: "lun1")
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            
            views[i].frame = CGRect(x: sliderContentView.frame.width * CGFloat(i), y: 0, width: sliderContentView.frame.width, height: 150)
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    private lazy var pageControl: UIPageControl = {
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
}

// MARK: - setupUI

extension AboutPlaceViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    private func setupUI() {
        separatorView.backgroundColor = .defaultGrayTextFieldColor
        separatorViewTwo.backgroundColor = .defaultGrayTextFieldColor
        separatorViewThree.backgroundColor = .defaultGrayTextFieldColor
        placeImage.backgroundColor = .systemBrown
        shortNameOfPlaceLabel.numberOfLines = 2
        saveLabel.text = "Сохранить"
        rateLabel.text = "Оценить"
        writeLabel.text = "Написать отзыв"
        userAnswearLabel.text = "Вы были в этом месте"
        userButton.setImage(UIImage(named: "done-rounded"), for: .normal)

        informationLabel.text = "Информация"
        saveButton.backgroundColor = .systemBlue
        saveButton.setImage(UIImage(named: "time"), for: .normal)
        
        rateRoundButton.backgroundColor = .systemYellow
        rateRoundButton.titleLabel?.font = .systemFont20Semibold
        
        rateButton.backgroundColor = .systemBlue
        rateButton.setImage(UIImage(named: "time"), for: .normal)
        
        writeTipButton.backgroundColor = .systemBlue
        writeTipButton.setImage(UIImage(named: "time"), for: .normal)
        
        userButton.backgroundColor = .systemRed
        
        timeIcon.image = UIImage(named: "time")
        phoneIcon.image = UIImage(named: "phone")
        webIcon.image = UIImage(named: "web")
        adressIcon.image = UIImage(named: "pin")
        
        scrollView.isScrollEnabled = true
        fullNameLabel.font = .systemFont14Semibold
        shortNameOfPlaceLabel.font = .systemFont20Semibold
    }
}

// MARK: - setupLayout

extension AboutPlaceViewController {

    func setupScrollView() {
        view.addSubview(scrollView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func setupScrollViewContainer() {
        scrollView.addSubview(scrollViewContainer)

        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    private func setUpLayout() {

        sliderContentView.addSubview(imageScrollView)
        imageScrollView.edgeTo(view: sliderContentView)

        sliderContentView.addSubview(pageControl)

        setupScrollView()
        setupScrollViewContainer()

        scrollViewContainer.addArrangedSubview(sliderContentView)
        scrollViewContainer.addArrangedSubview(restInfoContentView)

        self.view.backgroundColor = .white
        
        restInfoContentView.addSubviewWithTAMIC(pageControllView)
        restInfoContentView.addSubviewWithTAMIC(shortNameOfPlaceLabel)
        restInfoContentView.addSubviewWithTAMIC(fullNameLabel)
        restInfoContentView.addSubviewWithTAMIC(rateRoundButton)
        
        restInfoContentView.addSubviewWithTAMIC(saveButton)
        restInfoContentView.addSubviewWithTAMIC(rateButton)
        restInfoContentView.addSubviewWithTAMIC(writeTipButton)
        
        restInfoContentView.addSubviewWithTAMIC(saveLabel)
        restInfoContentView.addSubviewWithTAMIC(rateLabel)
        restInfoContentView.addSubviewWithTAMIC(writeLabel)
        restInfoContentView.addSubviewWithTAMIC(separatorView)
        restInfoContentView.addSubviewWithTAMIC(separatorViewTwo)
        restInfoContentView.addSubviewWithTAMIC(separatorViewThree)
        restInfoContentView.addSubviewWithTAMIC(userAnswearLabel)
        restInfoContentView.addSubviewWithTAMIC(userButton)
        restInfoContentView.addSubviewWithTAMIC(informationLabel)
        restInfoContentView.addSubviewWithTAMIC(openLabel)
        restInfoContentView.addSubviewWithTAMIC(timeIcon)
        restInfoContentView.addSubviewWithTAMIC(phoneLabel)
        restInfoContentView.addSubviewWithTAMIC(phoneIcon)
        restInfoContentView.addSubviewWithTAMIC(webSiteLabel)
        restInfoContentView.addSubviewWithTAMIC(webIcon)
        restInfoContentView.addSubviewWithTAMIC(miniMapView)
        restInfoContentView.addSubviewWithTAMIC(adressLabel)
        restInfoContentView.addSubviewWithTAMIC(adressIcon)
        
        shortNameOfPlaceLabel.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(20)
            $0.right.equalTo(rateRoundButton.snp.left).offset(-10)
            $0.top.equalTo(restInfoContentView.snp.top).offset(10)
        }
        fullNameLabel.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(20)
            $0.top.equalTo(shortNameOfPlaceLabel.snp.bottom).offset(10)
        }
        rateRoundButton.snp.makeConstraints {
            $0.right.equalTo(restInfoContentView.snp.right).offset(-20)
            $0.top.equalTo(restInfoContentView.snp.top).offset(10)
            $0.height.width.equalTo(64)
        }
        separatorView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(20)
            $0.height.equalTo(17)
        }
        saveButton.snp.makeConstraints {
            $0.left.equalTo(self.restInfoContentView.snp.left).offset(40)
            $0.top.equalTo(separatorView.snp.bottom).offset(15)
            $0.height.width.equalTo(50)
        }
        rateButton.snp.makeConstraints {
            $0.centerY.equalTo(saveButton.snp.centerY)
            $0.centerX.equalTo(self.restInfoContentView.snp.centerX)
            $0.height.width.equalTo(50)
        }
        writeTipButton.snp.makeConstraints {
            $0.centerY.equalTo(saveButton.snp.centerY)
            $0.right.equalTo(self.restInfoContentView.snp.right).offset(-40)
            $0.height.width.equalTo(50)
        }
        
        saveLabel.snp.makeConstraints {
            $0.centerX.equalTo(saveButton.snp.centerX)
            $0.top.equalTo(saveButton.snp.bottom).offset(6)
        }
        rateLabel.snp.makeConstraints {
            $0.centerX.equalTo(rateButton.snp.centerX)
            $0.centerY.equalTo(saveLabel.snp.centerY)
        }
        writeLabel.snp.makeConstraints {
            $0.centerX.equalTo(writeTipButton.snp.centerX)
            $0.centerY.equalTo(saveLabel.snp.centerY)
        }
        
        separatorViewTwo.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(writeLabel.snp.bottom).offset(14)
            $0.height.equalTo(17)
        }
        userAnswearLabel.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(30)
            $0.right.equalToSuperview()
            $0.top.equalTo(separatorViewTwo.snp.bottom).offset(7)
        }

        userButton.snp.makeConstraints {
            $0.left.equalTo(userAnswearLabel.snp.left)
            $0.top.equalTo(userAnswearLabel.snp.bottom).offset(7)
            $0.height.width.equalTo(25)
        }

        separatorViewThree.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalTo(userButton.snp.bottom).offset(7)
            $0.height.equalTo(17)
        }
        informationLabel.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(30)
            $0.top.equalTo(separatorViewThree.snp.bottom).offset(10)
        }
        timeIcon.snp.makeConstraints {
            $0.top.equalTo(informationLabel.snp.bottom).offset(10)
            $0.left.equalTo(restInfoContentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        openLabel.snp.makeConstraints {
            $0.left.equalTo(timeIcon.snp.right).offset(20)
            $0.centerY.equalTo(timeIcon.snp.centerY)
        }
        phoneIcon.snp.makeConstraints {
            $0.top.equalTo(timeIcon.snp.bottom).offset(10)
            $0.left.equalTo(restInfoContentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        phoneLabel.snp.makeConstraints {
            $0.left.equalTo(phoneIcon.snp.right).offset(20)
            $0.centerY.equalTo(phoneIcon.snp.centerY)
        }
        webIcon.snp.makeConstraints {
            $0.top.equalTo(phoneIcon.snp.bottom).offset(10)
            $0.left.equalTo(restInfoContentView.snp.left).offset(30)
            $0.height.width.equalTo(25)
        }
        webSiteLabel.snp.makeConstraints {
            $0.left.equalTo(webIcon.snp.right).offset(20)
            $0.centerY.equalTo(webIcon.snp.centerY)
        }
        miniMapView.snp.makeConstraints {
            $0.right.equalTo(restInfoContentView.snp.right)
            $0.left.equalTo(restInfoContentView.snp.left)
            $0.top.equalTo(webSiteLabel.snp.bottom).offset(10)
            $0.height.width.equalTo(100)
        }
        adressIcon.snp.makeConstraints {
            $0.left.equalTo(restInfoContentView.snp.left).offset(30)
            $0.top.equalTo(miniMapView.snp.bottom).offset(10)
            $0.height.width.equalTo(25)
        }
        adressLabel.snp.makeConstraints {
            $0.left.equalTo(adressIcon.snp.right).offset(20)
            $0.centerY.equalTo(adressIcon.snp.centerY)
        }
    }
}
//AboutPlaceViewController
extension AboutPlaceViewController: PresenterToViewAboutPlaceProtocol{
    // TODO: Implement View Output Methods
    func showImages(_ images: [UIImage?]) {
        self.images = images
    }
    
    func showObject(_ object: Object) {
        let la = CLLocationDegrees(object.latitude) ?? 0
        let lo = CLLocationDegrees(object.longitude) ?? 0
        let currentLocation = CLLocation(latitude: la, longitude: lo)
        
        miniMapView.searchRadius(currentLocation, radius: 300)
        let cameraCenter = CLLocation(latitude: la, longitude: lo)
        let region = MKCoordinateRegion(center: cameraCenter.coordinate,
                                        latitudinalMeters: 10000,
                                        longitudinalMeters: 10000)
        miniMapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        miniMapView.setCameraZoomRange(MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000), animated: true)
        
        self.shortNameOfPlaceLabel.text = object.name
        self.fullNameLabel.text = object.description
        self.rateRoundButton.setTitle(object.mark, for: .normal)
        self.openLabel.text = object.workTime
        self.phoneLabel.text = object.phone
        self.webSiteLabel.text = object.site
        self.adressLabel.text = object.street

    }
}
