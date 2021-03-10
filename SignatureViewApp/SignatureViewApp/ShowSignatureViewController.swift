//
//  ShowSignatureViewController.swift
//  SignatureViewApp
//
//  Created by Deepak Kumar on 29/12/20.
//

import UIKit

final class ShowSignatureViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var showSignatureView: UIView!
    @IBOutlet private weak var signatureImageView: UIImageView!
    var signatureImage: UIImage?
    var lineArray: [[CGPoint]] = [[CGPoint]]()
    private let bezierPath = UIBezierPath()
    
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        signatureImageView.image = signatureImage
        drawSignature(from: lineArray)
    }
    
    private func drawSignature(from lineArray: [[CGPoint]]) {
        bezierPath.flatness = 10
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
        bezierPath.lineWidth = 2
        bezierPath.miterLimit = -10
        //bezierPath.stroke(with: .normal, alpha: 0.5)
        
        lineArray.forEach { pointArray in
            for (index, value) in pointArray.enumerated() {
                if index == 0 {
                    bezierPath.move(to: value)
                } else {
                    bezierPath.addLine(to: value)
                    showSignatureView.setNeedsDisplay()
                }
            }
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = showSignatureView.bounds
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        showSignatureView.layer.addSublayer(shapeLayer)
    }
    
}
