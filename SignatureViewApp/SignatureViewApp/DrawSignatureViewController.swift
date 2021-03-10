//
//  DrawSignatureViewController.swift
//  SignatureViewApp
//
//  Created by Deepak Kumar on 29/12/20.
//

import UIKit

final class DrawSignatureViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var signatureView: DrawView!
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSignatureViewController", let showViewController = segue.destination as? ShowSignatureViewController {
            showViewController.signatureImage = signatureView.getSignatureImage()
            showViewController.lineArray = signatureView.lineArray
        }
    }
    
    // MARK: - IBActions
    @IBAction private func clearButtonTapped() {
        signatureView.resetDrawing()
    }
}

