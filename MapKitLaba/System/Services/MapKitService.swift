//
//  MapKitService.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 04.01.2023.
//

import Foundation
import UIKit

protocol MapKitServiceProtocol {
    var imagePlacesArray: [UIImage]? { get set }
    func getImages(object: Objects) -> [UIImage?]
    func getObjects(object: Objects) -> Object
    
}

struct Object {
    var name: String
    var description: String
    var mark: String
    var workTime: String
    var phone: String
    var site: String
    var latitude: String
    var longitude: String
    var street: String
    
//    init() {
//        
//        self.name = ""
//        self.description = ""
//        self.mark = ""
//        self.workTime = ""
//        self.phone = ""
//        self.site = ""
//        self.latitude = ""
//        self.longitude = ""
//        self.street = ""
//    }
}

enum Objects {
    case lunacharskiy
    case musson
    case malachovHill
    case submergedShips
    case chersonesTavr
    case panorama
    case cementary
    case sevSU
    case omega
    case seaMall
}


final class MapKitService: MapKitServiceProtocol {
    
    var imagePlacesArray: [UIImage]?
    
    func getObjects(object: Objects) -> Object {
        switch object {
        case .lunacharskiy:
            let lunacharskiy = Object(name: "Театр Луначарского", description: "Театр", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.613924", longitude: "33.520454", street: "проспект Нахимова, 6")
            return lunacharskiy
        case .musson:
            let musson = Object(name: "Муссон", description: "торгово-развлекательный центр", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.589421", longitude: "33.488199", street: "​улица Вакуленчука, 29")
            return musson
        case .malachovHill:
            let malachovHill = Object(name: "Малахов курган", description: "мемориальный комплекс", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.603649", longitude: "33.549038", street: "​​​Окопная, 1/2")
            return malachovHill
        
        case .submergedShips:
            let submergedShips = Object(name: "Памятник затопленным кораблям", description: "мемориал", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.618366", longitude: "33.524321", street: "​​​Окопная, 1/2")
            return submergedShips

        case .chersonesTavr:
            let chersonesTavr = Object(name: "Херсонес Таврический", description: "национальный музей-заповедник", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.610657", longitude: "33.49189", street: "​​​​Древняя улица, 1")
            return chersonesTavr
        
        case .panorama:
            let panorama = Object(name: "Панорама Оборона Севастополя 1854-1855 гг", description: "Музеи", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.595362", longitude: "33.522789", street: "​​​​​площадь Ушакова, 1/1")
            return panorama
        
        case .cementary:
            let cementary = Object(name: "LUNACHARSKIY_TITLE", description: "LUNACHARSKIY_SUBTITLE", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.602334", longitude: "33.505197", street: "LUNACHARSKIY_LOCATIONNAME")
            return cementary
        
        case .sevSU:
            let sevSU = Object(name: "LUNACHARSKIY_TITLE", description: "LUNACHARSKIY_SUBTITLE", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.594801", longitude: "33.476118", street: "LUNACHARSKIY_LOCATIONNAME")
            return sevSU

        case .omega:
            let omega = Object(name: "LUNACHARSKIY_TITLE", description: "LUNACHARSKIY_SUBTITLE", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.613924", longitude: "33.520454", street: "LUNACHARSKIY_LOCATIONNAME")
            return omega
        case .seaMall:
            let seaMall = Object(name: "Sea Mall", description: "торговый центр", mark: "4.6", workTime: "8:00 - 21:00", phone: "+79787099306", site: "Lunacharskiy.ru", latitude: "44.59022", longitude: "33.485032", street: "​​проспект Генерала Острякова, 260")
            
            return seaMall
        }
    }
    
    func getImages(object: Objects) -> [UIImage?] {
        
        switch object {
        case .lunacharskiy:
            return lunacharskiyImages
        case .musson:
            return mussonImages
        case .malachovHill:
            return lavandaImages
        case .submergedShips:
            return submergeShipsImages
        case .chersonesTavr:
            return hersonesImages
        case .panorama:
            return panoramaImages
        case .cementary:
            return cementaryImages
        case .sevSU:
            return sevSUImages
        case .omega:
            return omegaImages
        case .seaMall:
            return seaMallImages
        }
    }
    
    var lunacharskiyImages: [UIImage?] = [
        UIImage(named: "lun1"),
        UIImage(named: "lun2"),
        UIImage(named: "lun3"),
        UIImage(named: "lun4"),
        UIImage(named: "lun5"),
    ]
    
    var omegaImages: [UIImage?] = [
        UIImage(named: "om1"),
        UIImage(named: "om2"),
        UIImage(named: "om3"),
        UIImage(named: "om4"),
        UIImage(named: "om5"),
    ]
    
    var mussonImages: [UIImage?] = [
        UIImage(named: "musson1"),
        UIImage(named: "musson2"),
        UIImage(named: "musson3"),
        UIImage(named: "musson4"),
        UIImage(named: "musson5"),
    ]
    
    var panoramaImages: [UIImage?] = [
        UIImage(named: "pan1"),
        UIImage(named: "pan2"),
        UIImage(named: "pan3"),
        UIImage(named: "pan4"),
        UIImage(named: "pan5"),
    ]
    
    var seaMallImages: [UIImage?] = [
        UIImage(named: "smal1"),
        UIImage(named: "smal2"),
        UIImage(named: "smal3"),
        UIImage(named: "smal4"),
        UIImage(named: "smal5"),
    ]
    
    var submergeShipsImages: [UIImage?] = [
        UIImage(named: "ship1"),
        UIImage(named: "ship2"),
        UIImage(named: "ship3"),
        UIImage(named: "ship4"),
        UIImage(named: "ship5"),
    ]
    
    var sevSUImages: [UIImage?] = [
        UIImage(named: "univ1"),
        UIImage(named: "univ2"),
        UIImage(named: "univ3"),
        UIImage(named: "univ4"),
        UIImage(named: "univ5"),
    ]
    
    var lavandaImages: [UIImage?] = [
        UIImage(named: "la1"),
        UIImage(named: "la2"),
        UIImage(named: "la3"),
        UIImage(named: "la4"),
        UIImage(named: "la5"),
    ]
    
    var hersonesImages: [UIImage?] = [
        UIImage(named: "hers1"),
        UIImage(named: "hers2"),
        UIImage(named: "hers3"),
        UIImage(named: "hers4"),
        UIImage(named: "hers5"),
    ]
    
    var cementaryImages: [UIImage?] = [
        UIImage(named: "cem1"),
        UIImage(named: "cem2"),
        UIImage(named: "cem3"),
        UIImage(named: "cem4"),
        UIImage(named: "cem5"),
    ]
}
