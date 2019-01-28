//
//  PlayViewController.swift
//  DrinkBoard
//
//  Created by Marko Splajt on 05/11/2018.
//  Copyright © 2018 MarkoSplajt. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import GoogleMobileAds

var audioPlayer = AVAudioPlayer()
var rewardBasedAd: GADRewardBasedVideoAd!

let defaults = UserDefaults()
var timesClicked = 15
var currentTimesClicked = 0
var isLoadedTimesClicked = false

// Button text
var buttonOnePointText = ["Player sitting on your RIGHT drinks.", "Simulate your best sex position with any player of your choice and both of you drink 2 sips.", "Choose who drinks.", "Everyone drinks except you.", "Person sitting LEFT to you drinks.", "Play ODD - EVEN game to 3 with the player to your right. Loser DRINKS.", "You don't drink this round.", "Girl with the longest HAIR takes 3 sips.", "Choose someone who then drinks your drink.", "5 + 5 x 5 + 5 = ? CORRECT - Everyone drinks; FALSE - You drink.", "If you are older than 30 - you drink. If you are younger than 30 - everyone drinks.", "Take off 2 pieces of your clothing.", "Choose 2 players who have to drink.", "Choose any player and stare each other in the eyes. First who blinks have to drink 5 sips.", "Choose 1 player and sit in his/hers lap for 1 round.", "Tallest player drinks.", "Just refill your glass with your drink and play again."]

var buttonTwoPointsText = ["Ask someone what is your favourite drink. TRUE - You drink; FALSE - He/She drinks.", "Change drinks with someone and both of you drink up.", "Spank a player of your choice and then both of you drink 3 sips.", "Arm wrestle with the person to your left. Loser drinks.", "Drink standing on ONE leg.", "Drink your whole drink with your eyes closed.", "Take 5 sips of your drink with a STRAW.", "Choose 2 drinks from the table and drink a sip from each one.", "Stand up and make 3 turns arround yourself and then take 3 sips.", "Finish up your whole drink.", "Tell a player of your choice to remove 2 pieces of his clothing. If he/she removes it you take 3 sips. If he/she refuses then everybody drink 3 sips.", "If your drink is WINE - take 5 sips. If your drink is BEER - take 4 sips. If your drink is any COCKTAIL - take 3 sips. If your drink is WHISKY - take 2 sips.", "You and the player with most points drink 3 sips.", "Choose 1 drink on the table with your eyes closed and drink it."]

var buttonThreePointsText = ["You have to be quiet for 1 whole round, or else you have to DRINK UP your whole drink.", "Perform the next task of the next 2 players.", "Drink your whole drink and play again.", "Drink double.", "Everyone drink their whole drinks.", "Choose someone and both of you drink your drinks with your arms crossed.", "You and the player to your right stand up on 1 foot and try to touch the ground with the opposite hand. The player who touches the ground last, takes 4 sips.", "Hold your breath for 15 seconds and then drink your whole drink.", "Choose the largest drink on the table and drink it up."]

class PlayViewController: UIViewController, GADRewardBasedVideoAdDelegate {
    // Score Labels
    @IBOutlet var playerOneSL: UILabel!
    @IBOutlet var playerTwoSL: UILabel!
    @IBOutlet var playerThreeSL: UILabel!
    @IBOutlet var playerFourSL: UILabel!
    @IBOutlet var playerFiveSL: UILabel!
    @IBOutlet var playerSixSL: UILabel!
    //@IBOutlet var playerSevenSL: UILabel!
    //@IBOutlet var playerEightSL: UILabel!
    
    // Initial score label value
    var playerOneSLValue = 50
    var playerTwoSLValue = 50
    var playerThreeSLValue = 50
    var playerFourSLValue = 50
    var playerFiveSLValue = 50
    var playerSixSLValue = 50
    //var playerSevenSLValue = 50
    //var playerEightSLValue = 50
    
    // Player button Outlets
    @IBOutlet var playerOneButton1: UIButton!
    @IBOutlet var playerOneButton2: UIButton!
    @IBOutlet var playerOneButton3: UIButton!
    
    @IBOutlet var playerTwoButton1: UIButton!
    @IBOutlet var playerTwoButton2: UIButton!
    @IBOutlet var playerTwoButton3: UIButton!
    
    @IBOutlet var playerThreeButton1: UIButton!
    @IBOutlet var playerThreeButton2: UIButton!
    @IBOutlet var playerThreeButton3: UIButton!
    
    @IBOutlet var playerFourButton1: UIButton!
    @IBOutlet var playerFourButton2: UIButton!
    @IBOutlet var playerFourButton3: UIButton!
    
    @IBOutlet var playerFiveButton1: UIButton!
    @IBOutlet var playerFiveButton2: UIButton!
    @IBOutlet var playerFiveButton3: UIButton!
    
    @IBOutlet var playerSixButton1: UIButton!
    @IBOutlet var playerSixButton2: UIButton!
    @IBOutlet var playerSixButton3: UIButton!
    
    /*@IBOutlet var playerSevenButton1: UIButton!
    @IBOutlet var playerSevenButton2: UIButton!
    @IBOutlet var playerSevenButton3: UIButton!
    
    @IBOutlet var playerEightButton1: UIButton!
    @IBOutlet var playerEightButton2: UIButton!
    @IBOutlet var playerEightButton3: UIButton!*/
    
    func timesClickedLoadOnStart() {
        if(!isLoadedTimesClicked) {
            if UserDefaults.standard.object(forKey: "timesClicked") == nil {
                defaults.set(timesClicked, forKey: "timesClicked")
            }
            
            currentTimesClicked = defaults.object(forKey: "timesClicked") as! Int
            
            isLoadedTimesClicked = true
        }
        
        currentTimesClicked -= 1
        if(currentTimesClicked <= 0) {
            currentTimesClicked = timesClicked
            
            // Show ad
            if rewardBasedAd.isReady {
                rewardBasedAd.present(fromRootViewController: self)
            }
        }
    }
    
    // Player Button Action on click
    @IBAction func playerOneButton1Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerOneSLValue -= 1
        playerOneSL.text = String(playerOneSLValue)

        if playerOneSLValue > 0 {
            button1Point()
        }
        else {
            gameOver()
        }

        //playerTwoEnabled()
    }
    
    @IBAction func playerOneButton2Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerOneSLValue -= 2
        playerOneSL.text = String(playerOneSLValue)

        if playerOneSLValue > 0 {
            button2Points()
        }
        else {
            gameOver()
        }
        
        //playerTwoEnabled()
    }
    
    @IBAction func playerOneButton3Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerOneSLValue -= 3
        playerOneSL.text = String(playerOneSLValue)
            
        if playerOneSLValue > 0 {
            button3Points()
        }
        else {
            gameOver()
        }
        
        //playerTwoEnabled()
    }
    
    @IBAction func playerTwoButton1Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerTwoSLValue -= 1
        playerTwoSL.text = String(playerTwoSLValue)
        
        if playerTwoSLValue > 0 {
            button1Point()
        }
        else {
            gameOver()
        }
        
        //playerThreeEnabled()
    }
    
    @IBAction func playerTwoButton2Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerTwoSLValue -= 2
        playerTwoSL.text = String(playerTwoSLValue)
       
        if playerTwoSLValue > 0 {
            button2Points()
        }
        else {
            gameOver()
        }
        
        //playerThreeEnabled()
    }
    
    @IBAction func playerTwoButton3Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerTwoSLValue -= 3
        playerTwoSL.text = String(playerTwoSLValue)
        
        if playerTwoSLValue > 0 {
            button3Points()
        }
        else {
            gameOver()
        }
        
        //playerThreeEnabled()
    }
    
    @IBAction func playerThreeButton1Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerThreeSLValue -= 1
        playerThreeSL.text = String(playerThreeSLValue)
        
        if playerThreeSLValue > 0 {
            button1Point()
        }
        else {
            gameOver()
        }
        
        //playerFourEnabled()
    }
    
    @IBAction func playerThreeButton2Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerThreeSLValue -= 2
        playerThreeSL.text = String(playerThreeSLValue)
        
        if playerThreeSLValue > 0 {
            button2Points()
        }
        else {
            gameOver()
        }
        
        //playerFourEnabled()
    }
    
    @IBAction func playerThreeButton3Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerThreeSLValue -= 3
        playerThreeSL.text = String(playerThreeSLValue)
        
        if playerThreeSLValue > 0 {
            button3Points()
        }
        else {
            gameOver()
        }
        
        //playerFourEnabled()
    }
    
    @IBAction func playerFourButton1Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerFourSLValue -= 1
        playerFourSL.text = String(playerFourSLValue)
        
        if playerFourSLValue > 0 {
            button1Point()
        }
        else {
            gameOver()
        }
        
        //playerFiveEnabled()
    }
    
    @IBAction func playerFourButton2Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerFourSLValue -= 2
        playerFourSL.text = String(playerFourSLValue)
        
        if playerFourSLValue > 0 {
            button2Points()
        }
        else {
            gameOver()
        }
        
        //playerFiveEnabled()
    }
    
    @IBAction func playerFourButton3Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerFourSLValue -= 3
        playerFourSL.text = String(playerFourSLValue)
        
        if playerFourSLValue > 0 {
            button3Points()
        }
        else {
            gameOver()
        }
        
        //playerFiveEnabled()
    }
    
    @IBAction func playerFiveButton1Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerFiveSLValue -= 1
        playerFiveSL.text = String(playerFiveSLValue)
        
        if playerFiveSLValue > 0 {
            button1Point()
        }
        else {
            gameOver()
        }
        
        //playerSixEnabled()
    }
    
    @IBAction func playerFiveButton2Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerFiveSLValue -= 2
        playerFiveSL.text = String(playerFiveSLValue)
        
        if playerFiveSLValue > 0 {
            button2Points()
        }
        else {
            gameOver()
        }
        
        //playerSixEnabled()
    }
    
    @IBAction func playerFiveButton3Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerFiveSLValue -= 3
        playerFiveSL.text = String(playerFiveSLValue)
        
        if playerFiveSLValue > 0 {
            button3Points()
        }
        else {
            gameOver()
        }
        
        //playerSixEnabled()
    }
    
    @IBAction func playerSixButton1Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerSixSLValue -= 1
        playerSixSL.text = String(playerSixSLValue)
        
        if playerSixSLValue > 0 {
            button1Point()
        }
        else {
            gameOver()
        }
        
        /*startingButtons()
        
        self.playerSixSL.alpha = 1*/
    }
    
    @IBAction func playerSixButton2Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerSixSLValue -= 2
        playerSixSL.text = String(playerSixSLValue)
        
        if playerSixSLValue > 0 {
            button2Points()
        }
        else {
            gameOver()
        }
        
        /*startingButtons()
        
        self.playerSixSL.alpha = 1*/
    }
    
    @IBAction func playerSixButton3Action(_ sender: UIButton) {
        timesClickedLoadOnStart()
        playerSixSLValue -= 3
        playerSixSL.text = String(playerSixSLValue)
        
        if playerSixSLValue > 0 {
            button3Points()
        }
        else {
            gameOver()
        }
        
        /*startingButtons()
        
        self.playerSixSL.alpha = 1*/
    }
    
    
    /*@IBAction func playerSevenButton1Action(_ sender: UIButton)
    {
        playerSevenSLValue -= 1
        playerSevenSL.text = String(playerSevenSLValue)
    }
    
    @IBAction func playerSevenButton2Action(_ sender: UIButton)
    {
        playerSevenSLValue -= 2
        playerSevenSL.text = String(playerSevenSLValue)
    }
    
    @IBAction func playerSevenButton3Action(_ sender: UIButton)
    {
        playerSevenSLValue -= 3
        playerSevenSL.text = String(playerSevenSLValue)
    }
    
    @IBAction func playerEightButton1Action(_ sender: UIButton)
    {
        playerEightSLValue -= 1
        playerEightSL.text = String(playerEightSLValue)
    }
    
    @IBAction func playerEightButton2Action(_ sender: UIButton)
    {
        playerEightSLValue -= 2
        playerEightSL.text = String(playerEightSLValue)
    }
    
    @IBAction func playerEightButton3Action(_ sender: UIButton)
    {
        playerEightSLValue -= 3
        playerEightSL.text = String(playerEightSLValue)
    }*/
    
    // Resets player scores to 50
    @IBAction func resetPlayerScores(_ sender: UIButton) {
        playerOneSLValue = 50
        playerOneSL.text = String(playerOneSLValue)
        
        playerTwoSLValue = 50
        playerTwoSL.text = String(playerTwoSLValue)
        
        playerThreeSLValue = 50
        playerThreeSL.text = String(playerThreeSLValue)
        
        playerFourSLValue = 50
        playerFourSL.text = String(playerFourSLValue)
        
        playerFiveSLValue = 50
        playerFiveSL.text = String(playerFiveSLValue)
        
        playerSixSLValue = 50
        playerSixSL.text = String(playerSixSLValue)
        
        /*startingButtons()
        
        startingBlink()*/
        
        /*playerSevenSLValue = 50
        playerSevenSL.text = String(playerSevenSLValue)
        
        playerEightSLValue = 50
        playerEightSL.text = String(playerEightSLValue)*/
    }
    
    func gameOver() {
        let title: String = "Well done!"
        let message = "You are drunk."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Drink again", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
            
        playerOneSLValue = 50
        playerOneSL.text = String(playerOneSLValue)
        
        playerTwoSLValue = 50
        playerTwoSL.text = String(playerTwoSLValue)
        
        playerThreeSLValue = 50
        playerThreeSL.text = String(playerThreeSLValue)
        
        playerFourSLValue = 50
        playerFourSL.text = String(playerFourSLValue)
        
        playerFiveSLValue = 50
        playerFiveSL.text = String(playerFiveSLValue)
        
        playerSixSLValue = 50
        playerSixSL.text = String(playerSixSLValue)
    
        /*startingButtons()
        
        startingBlink()*/
    }
    
    func button1Point() {
        let title: String = "Drink!"
        let message = (buttonOnePointText.randomElement()!)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "DONE", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        audioPlayer.play()
    }
    
    func button2Points() {
        let title: String = "Drink!"
        let message = (buttonTwoPointsText.randomElement()!)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "DONE", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        audioPlayer.play()
    }
    
    func button3Points() {
        let title: String = "Drink!"
        let message = (buttonThreePointsText.randomElement()!)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "DONE", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        audioPlayer.play()
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {
        playerOneSLValue -= 1
        playerOneSL.text = String(playerOneSLValue)
        
        playerTwoSLValue -= 1
        playerTwoSL.text = String(playerTwoSLValue)
        
        playerThreeSLValue -= 1
        playerThreeSL.text = String(playerThreeSLValue)
        
        playerFourSLValue -= 1
        playerFourSL.text = String(playerFourSLValue)
        
        playerFiveSLValue -= 1
        playerFiveSL.text = String(playerFiveSLValue)
        
        playerSixSLValue -= 1
        playerSixSL.text = String(playerSixSLValue)
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd.delegate = self
        rewardBasedAd.load(GADRequest(), withAdUnitID: "ca-app-pub-7711507841405386/5580695284")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        
        print(reverse(text: "stressed"))
                        
        rewardBasedAd = GADRewardBasedVideoAd.sharedInstance()
        rewardBasedAd.delegate = self
        rewardBasedAd.load(GADRequest(), withAdUnitID: "ca-app-pub-7711507841405386/5580695284")
        
        // test: ca-app-pub-3940256099942544/1712485313
        
        // real:  ca-app-pub-7711507841405386/5580695284
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.ignoresSiblingOrder = false
        skView.showsNodeCount = false
        skView.presentScene(scene)
        scene.scaleMode = .aspectFill
        
        //startingButtons()

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "glassKnock", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        
        if (UserDefaults.standard.value(forKey: "name") as? String) == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let next = storyboard.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
            addChildVC(viewController: next)
        }
    }
    
    func reverse(text: String) -> String {
        return String(text.reversed())
    }
    
    /*func startingButtons()
    {
        playerOneButton1.isEnabled = true
        playerOneButton2.isEnabled = true
        playerOneButton3.isEnabled = true
        
        playerTwoButton1.isEnabled = false
        playerTwoButton2.isEnabled = false
        playerTwoButton3.isEnabled = false
        
        playerThreeButton1.isEnabled = false
        playerThreeButton2.isEnabled = false
        playerThreeButton3.isEnabled = false
        
        playerFourButton1.isEnabled = false
        playerFourButton2.isEnabled = false
        playerFourButton3.isEnabled = false
        
        playerFiveButton1.isEnabled = false
        playerFiveButton2.isEnabled = false
        playerFiveButton3.isEnabled = false
        
        playerSixButton1.isEnabled = false
        playerSixButton2.isEnabled = false
        playerSixButton3.isEnabled = false
        
        labelOneBlink()
    }
    
    func startingBlink()
    {
        self.playerTwoSL.alpha = 1
        self.playerThreeSL.alpha = 1
        self.playerFourSL.alpha = 1
        self.playerFiveSL.alpha = 1
        self.playerSixSL.alpha = 1
    }
    
    func labelOneBlink()
    {
        self.playerOneSL.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: .repeat, animations: {
            self.playerOneSL.alpha = 0.2
            }, completion: nil)
    }
    
    func labelTwoBlink()
    {
        self.playerTwoSL.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: .repeat, animations: {
            self.playerTwoSL.alpha = 0.2
        }, completion: nil)
        
        self.playerOneSL.alpha = 1
    }
    
    func labelThreeBlink()
    {
        self.playerThreeSL.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: .repeat, animations: {
            self.playerThreeSL.alpha = 0.2
        }, completion: nil)
        
        self.playerTwoSL.alpha = 1
    }
    
    func labelFourBlink()
    {
        self.playerFourSL.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: .repeat, animations: {
            self.playerFourSL.alpha = 0.2
        }, completion: nil)
        
        self.playerThreeSL.alpha = 1
    }
    
    func labelFiveBlink()
    {
        self.playerFiveSL.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: .repeat, animations: {
            self.playerFiveSL.alpha = 0.2
        }, completion: nil)
        
        self.playerFourSL.alpha = 1
    }
    
    func labelSixBlink()
    {
        self.playerSixSL.alpha = 1
        UIView.animate(withDuration: 1.5, delay: 0, options: .repeat, animations: {
            self.playerSixSL.alpha = 0.2
        }, completion: nil)
        
        self.playerFiveSL.alpha = 1
    }
    
    func playerTwoEnabled()
    {
        playerOneButton1.isEnabled = false
        playerOneButton2.isEnabled = false
        playerOneButton3.isEnabled = false
        
        playerTwoButton1.isEnabled = true
        playerTwoButton2.isEnabled = true
        playerTwoButton3.isEnabled = true
        
        labelTwoBlink()
    }
    
    func playerThreeEnabled()
    {
        playerTwoButton1.isEnabled = false
        playerTwoButton2.isEnabled = false
        playerTwoButton3.isEnabled = false
        
        playerThreeButton1.isEnabled = true
        playerThreeButton2.isEnabled = true
        playerThreeButton3.isEnabled = true
        
        labelThreeBlink()
    }
    
    func playerFourEnabled()
    {
        playerThreeButton1.isEnabled = false
        playerThreeButton2.isEnabled = false
        playerThreeButton3.isEnabled = false
        
        playerFourButton1.isEnabled = true
        playerFourButton2.isEnabled = true
        playerFourButton3.isEnabled = true
        
        labelFourBlink()
    }
    
    func playerFiveEnabled()
    {
        playerFourButton1.isEnabled = false
        playerFourButton2.isEnabled = false
        playerFourButton3.isEnabled = false
        
        playerFiveButton1.isEnabled = true
        playerFiveButton2.isEnabled = true
        playerFiveButton3.isEnabled = true
        
        labelFiveBlink()
    }
    
    func playerSixEnabled()
    {
        playerFiveButton1.isEnabled = false
        playerFiveButton2.isEnabled = false
        playerFiveButton3.isEnabled = false
        
        playerSixButton1.isEnabled = true
        playerSixButton2.isEnabled = true
        playerSixButton3.isEnabled = true
        
        labelSixBlink()
    }*/
}

extension UIViewController {
    func addChildVC(viewController: UIViewController){
        self.addChild(viewController)
        viewController.view.frame = self.view.frame
        self.view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}


