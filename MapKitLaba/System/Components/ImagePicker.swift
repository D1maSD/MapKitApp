//
//  ImagePicker.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 14.11.2022.
//

import UIKit

protocol ImagePickerDelegate: AnyObject {
    func didSelect(image: UIImage?)
}

final class ImagePicker: NSObject {
    
    // MARK: - Properties
    
    private lazy var pickerController: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.mediaTypes = ["public.image"]
        return picker
    }()
    
    var presentationController: UIViewController?
    var delegate: ImagePickerDelegate?
    
    init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        super.init()
        self.presentationController = presentationController
        self.delegate = delegate
    }
    
    private func createAction(forType: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        
        guard UIImagePickerController.isSourceTypeAvailable(forType) else {
            return UIAlertAction()
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            DispatchQueue.main.async {
                self.pickerController.sourceType = forType
                self.presentationController?.present(pickerController, animated: true)
            }
        }
        
    }
    
    
    func alert(isImageEmpty: Bool) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        if let action = self.createAction(forType: .camera, title: "camera") {
            alert.addAction(action)
        }
        
        if let action = self.createAction(forType: .photoLibrary, title: "photo library") {
            alert.addAction(action)
        }
        
        if let action = self.createAction(forType: .savedPhotosAlbum, title: "saved Photos Album") {
            alert.addAction(action)
        }
        
        if !isImageEmpty {
            alert.addAction(UIAlertAction(title: "Change",
                                          style: .default) { (_) in
                self.delegate?.didSelect(image: nil)
            })
        }
        
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action)
        presentationController?.present(alert, animated: true)
        
        
    }
    
    private func pickerController(_ controller: UIViewController, didSelect image: UIImage) {
        delegate?.didSelect(image: image)
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        pickerController(picker, didSelect: UIImage())
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        guard let image = info[.editedImage] as? UIImage else {
            return pickerController(picker, didSelect: UIImage())
        }
        pickerController(picker, didSelect: image)
    }
    
}

extension ImagePicker: UINavigationControllerDelegate {
    
}
