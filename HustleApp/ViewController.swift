//
//  ViewController.swift
//  HustleApp
//
//  Created by Kirollos on 4/5/19.
//  Copyright © 2019 david. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBluBG: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var onLbl: UILabel!
    
    
    var player:AVAudioPlayer! ;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do{
            player = try AVAudioPlayer(contentsOf: url);
        }catch let error as NSError{
            
            print(error.description)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
         self.cloudHolder.isHidden = false;
        self.darkBluBG.isHidden = true;
        self.powerBtn.isHidden = true;
        player.play()
 
        //animate rocket
        UIView.animate(
            withDuration: 2.3,
            animations: {
                self.rocket.frame = CGRect(x: 0, y: 260, width: 375, height: 166)
        }) { (completion) in
            
                self.hustleLbl.isHidden = false
                self.onLbl.isHidden = false
            
        }
    }
    
}

