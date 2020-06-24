//
//  ViewController.swift
//  WekanActionSheet
//
//  Created by Brian on 08/04/20.
//  Copyright © 2020 Wekan. All rights reserved.
//

import UIKit
import SwiftEntryKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showBottomSheetAction(sender: Any) {
        showCustomActionsheet()
    }
    
    @IBAction func showNotificationAction(sender: Any) {
        showNotificationView()
    }
    
    @IBAction func showAlertAction(sender: Any) {
        showAlertView()
    }
   
    @IBAction func showCustomViewAction(sender: Any) {
           showCustomListView()
       }
    @IBAction func showVCAction(sender: Any) {
           showViewControllerInSheet()
       }
    
    func showNotificationView() {
        // Generate top floating entry and set some properties
        var attributes = EKAttributes.topFloat
        attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(.systemRed), EKColor(.white)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
        attributes.statusBar = .dark
        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.minEdge), height: .intrinsic)

        let title = EKProperty.LabelContent(text: "Login Successful", style: .init(font: .boldSystemFont(ofSize: 16), color: EKColor.black))
        let description = EKProperty.LabelContent(text: "Go and checkout the features we offer you", style: .init(font: .systemFont(ofSize: 14), color: EKColor.chatMessage))
        let image = EKProperty.ImageContent(image: UIImage(named: "profile")!, size: CGSize(width: 35, height: 35))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)

        let contentView = EKNotificationMessageView(with: notificationMessage)
    
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }

    func showCustomActionsheet() {
        var attributes = EKAttributes.bottomToast
        // Set its background to white
        attributes.entryBackground = .color(color: .white)
        // Animate in and out using default translation
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        let title = EKProperty.LabelContent(text: "Login Successful", style: .init(font: .boldSystemFont(ofSize: 16), color: EKColor.headerText))
        let description = EKProperty.LabelContent(text: "Go and checkout the features we offer you", style: .init(font: .systemFont(ofSize: 14), color: EKColor.subText))
        let image = EKProperty.ImageContent(image: UIImage(named: "profile")!, size: CGSize(width: 35, height: 35))
        let themeImg = EKPopUpMessage.ThemeImage(image: image, position: EKPopUpMessage.ThemeImage.Position.topToTop(offset: 20))
        let buttonLabel = EKProperty.LabelContent(text: "OK", style: EKProperty.LabelStyle(font: .boldSystemFont(ofSize: 14), color: EKColor.standardContent))
        let buttonContent = EKProperty.ButtonContent(label: buttonLabel, backgroundColor: EKColor.standardBackground, highlightedBackgroundColor: EKColor.init(.blue))
        let popupmsg = EKPopUpMessage(themeImage: themeImg, title: title, description: description, button: buttonContent) {
            print("OK tapped")
            self.showNotificationView()
        }
        let customView = EKPopUpMessageView(with: popupmsg)
        customView.backgroundColor = .lightGray

        // Display the view with the configuration
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
    
    func showAlertView() {
        var attributes = EKAttributes.centerFloat
        attributes.entryBackground = .color(color: .white)

        // Animate in and out using default translation
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        
        let title = EKProperty.LabelContent(text: "Login Successful", style: .init(font: .boldSystemFont(ofSize: 16), color: EKColor.headerText))
        let description = EKProperty.LabelContent(text: "Go and checkout the features we offer you", style: .init(font: .systemFont(ofSize: 14), color: EKColor.subText))
        let image = EKProperty.ImageContent(image: UIImage(named: "profile")!, size: CGSize(width: 35, height: 35))
        let simpleMsg = EKSimpleMessage(image: image, title: title, description: description)
        let buttonLabel = EKProperty.LabelContent(text: "OK", style: EKProperty.LabelStyle(font: .boldSystemFont(ofSize: 14), color: EKColor.standardContent))
        let buttonContent = EKProperty.ButtonContent(label: buttonLabel, backgroundColor: EKColor.standardBackground, highlightedBackgroundColor: EKColor.init(.greenGrass))
        let buttonBarContent = EKProperty.ButtonBarContent(with: [buttonContent], separatorColor: .headerBackground, expandAnimatedly: false)
        let alertMsg = EKAlertMessage(simpleMessage: simpleMsg, buttonBarContent: buttonBarContent)
        
        let customView = EKAlertMessageView(with: alertMsg)
        SwiftEntryKit.display(entry: customView, using: attributes)
    }
    
    func showCustomListView() {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.screenInteraction = .dismiss
        attributes.entryInteraction = .forward
        attributes.entryBackground = .color(color: .white)
        // Animate in and out using default translation
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        SwiftEntryKit.display(entry: NibExampleView(), using: attributes)
    }
    
    func showViewControllerInSheet() {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = .infinity
        attributes.screenInteraction = .absorbTouches
        attributes.entryInteraction = .forward
        attributes.entryBackground = .color(color: .white)
        // Animate in and out using default translation
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        
        let viewController = ListViewController(with: NibExampleView())
        SwiftEntryKit.display(entry: viewController, using: attributes)
    }
}

