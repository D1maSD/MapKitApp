//
//  PlayerViewController.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 29.10.2022.
//  
//

import UIKit
import AVFoundation
import CoreData
import Foundation

final class PlayerViewController: UIViewController {
    
    
    // MARK: - Properties
    var presenter: ViewToPresenterPlayerProtocol?
    
    private var topShade = UIButton()
    private var songPreview = UIImageView()
    private var sougName = UILabel()
    private var groupName = UILabel()
    private var elapsedTimeLabel = UILabel()
    private var remainingTimeLabel = UILabel()
    private var moreButton = RoundButton()
    private var musicTrackBar = UISlider()
    private var playTrackButton = UIButton()
    private var previousTrackButton = UIButton()
    private var nextTrackButton = UIButton()
    private var topView = UIView()
    public var index: Int = 0
    public var songs: [Song] = []
    private var player = AVAudioPlayer()
    private var timer: Timer?
    private var playerManager = AudioManager()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupLayout()
        Task {
            await configure()
        }

        setupUI()
        
        musicTrackBar.addTarget(self, action: #selector(progressScrubbed(_:)), for: .valueChanged)
        playTrackButton.addTarget(
            self,
            action: #selector(didTapPlayPause(_:)),
            for: .touchUpInside
        )
        nextTrackButton.addTarget(
            self,
            action: #selector(playNextDidTapped),
            for: .touchUpInside
        )
        previousTrackButton.addTarget(
            self,
            action: #selector(playPreviousDidTapped),
            for: .touchUpInside
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        playerManager.player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        playerManager.player.stop()
    }
    
    private func configure() async {
        let song = songs[index]

        songPreview.image = UIImage(named: song.imageName)
        sougName.text = song.name
        groupName.text = song.artistName
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")

        do {

            musicTrackBar.value = 0.0
            playerManager.playMusic(for: song.trackName)
            musicTrackBar.value = 0.0
            musicTrackBar.maximumValue = Float(playerManager.player.duration)
            timerInit()

        } catch {
            print("Not played")
        }
    }
    
    
    private func timerInit() {
        print("TIMER INIT")
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.updateProgress),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func progressScrubbed(_ sender: UISlider) {
        playerManager.player.currentTime = Float64(sender.value)
    }
    
    @objc func updateSlider() {
        //MARK: CALLED WHEN WE START A TIMER
        musicTrackBar.value = Float(playerManager.player.currentTime)
    }
    
    @objc private func updateProgress() {
        musicTrackBar.value = Float(playerManager.player.currentTime)
        
        elapsedTimeLabel.text = getFormattedTime(timeInterval: playerManager.player.currentTime)
        let remainingTime = (playerManager.player.duration) - (playerManager.player.currentTime)
        remainingTimeLabel.text = getFormattedTime(timeInterval: remainingTime)
    }
    var lock = NSRecursiveLock()
    func lockOne() {
        lock.lock()
        lockTwo()
        lock.unlock()
    }

    func lockTwo() {
        lock.lock()
        playerManager.didTapPlayPause()
        setPlayPauseButton(isPlaying: playerManager.player.isPlaying)
        lock.unlock()
    }

    @objc func didTapPlayPause(_ sender: UIButton) {
        lockTwo()
//        playerManager.didTapPlayPause()
//        setPlayPauseButton(isPlaying: playerManager.player.isPlaying)
    }

    @objc func playButtonDidTapped() {
        //MARK: CALLED WHEN WE TAP PLAY TRACK
        if playerManager.player.isPlaying == true {
            playTrackButton.setImage(UIImage(named: "play_track"), for: .normal)
            playerManager.pauseMusic()
            timer?.invalidate()
            
        } else {
            playerManager.player.play()
            playTrackButton.setImage(UIImage(named: "pause"), for: .normal)
            timerInit()
        }
    }
    
    private func setPlayPauseButton(isPlaying: Bool) {
        playTrackButton.setImage(UIImage(named: isPlaying ? "pause" : "play_track"), for: .normal)
    }
    
    @objc func playPreviousDidTapped() async {
        if index > 0 {
            index -= 1
            playerManager.stop()
            timer?.invalidate()
            await configure()
        }
    }
    
    @objc func playNextDidTapped() async {
        if index < (songs.count - 1) {
            index += 1
            playerManager.player.stop()
            timer?.invalidate()
            await configure()
        }
    }
}


extension PlayerViewController: PresenterToViewPlayerProtocol{
    func setSongs(_ songs: [Song], index: Int) {
        self.songs = songs
        self.index = index
    }
    
    // TODO: Implement View Output Methods
}


extension PlayerViewController {
    // TODO: Implement setupUI() && setupLayout()
    private func setupLayout() {
        
        view.addSubview(elapsedTimeLabel)
        view.addSubview(remainingTimeLabel)
        view.addSubview(songPreview)
        view.addSubview(sougName)
        view.addSubview(moreButton)
        view.addSubview(musicTrackBar)
        view.addSubview(groupName)
        view.addSubview(topView)
        view.addSubview(playTrackButton)
        view.addSubview(previousTrackButton)
        view.addSubview(nextTrackButton)
        
        elapsedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        songPreview.translatesAutoresizingMaskIntoConstraints = false
        sougName.translatesAutoresizingMaskIntoConstraints = false
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        musicTrackBar.translatesAutoresizingMaskIntoConstraints = false
        groupName.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        playTrackButton.translatesAutoresizingMaskIntoConstraints = false
        previousTrackButton.translatesAutoresizingMaskIntoConstraints = false
        nextTrackButton.translatesAutoresizingMaskIntoConstraints = false
        
        songPreview.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(30)
            $0.right.equalTo(view.snp.right).offset(-30)
            $0.height.equalTo(self.view.frame.width - 100)
            $0.top.equalTo(view.snp.top).offset(100)
        }
        
        sougName.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(songPreview.snp.bottom).offset(50)
        }
        
        groupName.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(sougName.snp.bottom).offset(5)
        }
        
        moreButton.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-40)
            $0.top.equalTo(songPreview.snp.bottom).offset(65)
            $0.height.equalTo(30)
            $0.width.equalTo(30)
        }
        
        musicTrackBar.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-40)
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(groupName.snp.bottom).offset(40)
            $0.height.equalTo(30)
        }
        
        elapsedTimeLabel.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(40)
            $0.top.equalTo(musicTrackBar.snp.bottom).offset(5)
        }
        
        remainingTimeLabel.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-40)
            $0.top.equalTo(musicTrackBar.snp.bottom).offset(5)
        }
        
        playTrackButton.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(musicTrackBar.snp.bottom).offset(40)
            $0.height.equalTo(60)
            $0.width.equalTo(55)
        }
        
        previousTrackButton.snp.makeConstraints {
            $0.left.equalTo(view.snp.left).offset(60)
            $0.height.equalTo(60)
            $0.width.equalTo(55)
            $0.centerY.equalTo(playTrackButton.snp.centerY)
        }
        
        nextTrackButton.snp.makeConstraints {
            $0.right.equalTo(view.snp.right).offset(-60)
            $0.height.equalTo(60)
            $0.width.equalTo(55)
            $0.centerY.equalTo(playTrackButton.snp.centerY)
        }
    }
    
    private func getFormattedTime(timeInterval: TimeInterval) -> String {
        let mins = timeInterval / 60
        let secs = timeInterval.truncatingRemainder(dividingBy: 60)
        let timeFormatter = NumberFormatter()
        timeFormatter.minimumIntegerDigits = 2
        timeFormatter.minimumFractionDigits = 0
        timeFormatter.roundingMode = .down
        
        guard let minsString = timeFormatter.string(from: NSNumber(value: mins)), let secStr = timeFormatter.string(from: NSNumber(value: secs)) else {
            return "00:00"
        }
        return "\(minsString):\(secStr)"
    }
    
    private func setupUI() {
        
        elapsedTimeLabel.text = "00:00"
        remainingTimeLabel.text = "00:00"
        
        elapsedTimeLabel.font = .systemFont14Regular
        remainingTimeLabel.font = .systemFont14Regular
        
        
        musicTrackBar.setThumbImage(#imageLiteral(resourceName: "circle"), for: UIControl.State())
        self.view.backgroundColor = .systemGray
        self.songPreview.backgroundColor = .systemGreen
        self.songPreview.layer.cornerRadius = 12
        moreButton.backgroundColor = .systemGreen
        moreButton.setImage(UIImage(named: "more-horizontal"), for: .normal)
        previousTrackButton.setImage(UIImage(named: "previous_track"), for: .normal)
        nextTrackButton.setImage(UIImage(named: "next_track"), for: .normal)
        playTrackButton.setImage(UIImage(named: "pause"), for: .normal)
        sougName.font = .systemFont25Semibold
        sougName.textColor = .black
        groupName.font = .systemFont25Light
    }
}

// Facade
class AudioManager {

    var player = AVAudioPlayer()
    var mutexCondTest = MutexConditionTest()
    var readWrite = ReadWriteLock()
    var dispatchQueue = DispatchQueue(label: "mutexCondTest")
    var threads: [Thread] = []
    let lock = NSLock()

    func playMusic(for path: String) {


            let urlString = Bundle.main.path(forResource: path, ofType: "mp3")

            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

                guard let urlString = urlString else {
                    print("urlString is nil")
                    return
                }

                self.player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                self.player.play()
            } catch {
                print("Not played")
            }
    }

    func pauseMusic() {
        player.pause()
    }

    func stop() {
        player.stop()
    }

    

    func didTapPlayPause() {

        threads = [
            .init(block: { self.mutexCondTest.text_1()}),
            .init(block: { self.mutexCondTest.test_2()})
        ]
//        threads.forEach { thread in dispatchQueue.async {
//            thread.start()
//            }
//        }
        var testProperty = readWrite.testProperty
        print("first testProperty \(testProperty)")
        testProperty += 10
        print("second testProperty \(testProperty)")




        if player.isPlaying {
            dispatchQueue.async {
                self.threads[0].start()
            }
            player.pause()
        } else {
            dispatchQueue.async {
                self.threads[1].start()
            }
            player.play()
        }
    }
}


final class MutexConditionTest {
    private var condition = pthread_cond_t()
    private var mutex = pthread_mutex_t()
    private var check = false

    init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }

    func text_1() {
        print("\(#function) \(self) start")
                pthread_mutex_lock(&mutex)
                while check == false {
                    print("\(#function) \(self) while check")
                    pthread_cond_wait(&condition, &mutex)
                }
                // do something
                print("\(#function) \(self) get signal")
                pthread_mutex_unlock(&mutex)
                print("\(#function) \(self) end")
    }
    func test_2() {
            print("\(#function) \(self) start")
            pthread_mutex_lock(&mutex)
            check = true
            pthread_cond_signal(&condition)
            print("\(#function) \(self) send signal")
            pthread_mutex_unlock(&mutex)
            print("\(#function) \(self) end")
        }
}

final class ReadWriteLock {
    private var lock = pthread_rwlock_t()
    private var attr = pthread_rwlockattr_t()
    private var test = 0

    init() {
        pthread_rwlock_init(&lock, &attr)
//        pthread_mutex_init(&mutex, nil)
    }

    var testProperty: Int {
        get {
            pthread_rwlock_rdlock(&lock)
            let temp = test
            pthread_rwlock_unlock(&lock)
            return temp
        }
        set {
            pthread_rwlock_wrlock(&lock)
            test = newValue
            pthread_rwlock_unlock(&lock)
        }
    }
}

