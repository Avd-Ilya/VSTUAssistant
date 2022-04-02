//
//  RootViewController.swift
//  AimyboxUI
//
//  Created by Vladislav Popovich on 26.12.2019.
//  Copyright © Just Ai. All rights reserved.
//

import UIKit
import Aimybox
import AimyboxUI

class RootViewController: UIViewController, AimyboxProvider {

    let back = UIBarButtonItem(title: "Back",style: .plain,target: nil,action:nil)
    
    
    
    
    
    func aimybox() -> Aimybox? {
        let locale = Locale(identifier: "ru")
        
        guard let speechToText = SFSpeechToText(locale: locale) else {
            fatalError("Locale is not supported.")
        }
        guard let textToSpeech = AVTextToSpeech(locale: locale) else {
            fatalError("Locale is not supported.")
        }
          
        let dia = AimyboxDialogAPI(api_key: "JG3rchE83qej6OmgRpSkjpNaAsKbmdI8", unit_key: UIDevice.current.identifierForVendor!.uuidString)
        
        let config = AimyboxBuilder.config(speechToText, textToSpeech, dia)
        
        //let skill: AimyboxCustomSkill = ScheduleSkill()
        
        //config.dialogAPI.customSkills.append(skill)
        return AimyboxBuilder.aimybox(with: config)
    }

    @IBOutlet weak var aimyboxOpenButton: AimyboxOpenButton!
    
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        aimyboxOpenButton.presenter = self
        
        AimyboxViewController.onViewDidLoad = { vc in
            let aimyboxView = vc.aimyboxView
            aimyboxView.provider = self
            aimyboxView.backgroundColor = UIColor(named: "blue50")
            aimyboxView.greetingText = "Hi, how can i help you?"
            aimyboxView.emptyRecognitionText = "Please, repeat..."
        
            
            let button=UIButton.init(type: .system)
            button.setTitle("NEXT", for: .normal)
            button.frame.size = CGSize(width: 100, height: 50)

            //aimyboxView.addSubview(button)

        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let backItem = UIBarButtonItem()
//        backItem.title = "Something Else"
//        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
//    }

}
