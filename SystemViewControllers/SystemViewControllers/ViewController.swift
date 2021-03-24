//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by Carlos Alberto Savi on 17/03/21.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
        guard let image = imageView.image else { return }
        
        let activityController =
            UIActivityViewController(activityItems: [image],
                                     applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView =
            sender
        present(activityController, animated: true, completion: nil)
        
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        
        if let url = URL(string: "http://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true,
                    completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title:
                                                    "Choose Image Source", message: nil,
                                                preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Inclui ação de Câmera apenas se o device tiver esse recurso
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera",
                                             style: .default, handler: { action in
                                                imagePicker.sourceType = .camera
                                                self.present(imagePicker, animated: true, completion: nil)
                                             })
            alertController.addAction(cameraAction)
        }
        
        // Inclui ação de Biblioteca de Fotos apenas se o device tiver esse recurso
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library",
                                                   style: .default, handler: { action in
                                                    imagePicker.sourceType = .photoLibrary
                                                    self.present(imagePicker, animated: true, completion: nil)
                                                   })
            alertController.addAction(photoLibraryAction)
        }
        
        
        alertController.popoverPresentationController?.sourceView =
            sender
        
        present(alertController, animated: true, completion: nil)

        
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print("Can not send mail")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["example@example.com"])
        mailComposer.setSubject("Look at this")
        mailComposer.setMessageBody("Hello, this is an email from the app I made.", isHTML: false)
        
        if let image = imageView.image, let jpegData =
           image.jpegData(compressionQuality: 0.9) {
            mailComposer.addAttachmentData(jpegData, mimeType:
               "image/jpeg", fileName: "photo.jpg")
        }
        
        present(mailComposer, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Delegates
    
    // Delegate para a ImagePickerController informar (delegar) a ação do usuário
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)

    }
    
    // Para dispensar a system controller de email
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }

}

