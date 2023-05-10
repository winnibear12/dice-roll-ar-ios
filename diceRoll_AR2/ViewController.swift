//
//  ViewController.swift
//  diceRoll_AR2
//
//  Created by Simon Lee on 2023-03-23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        // Set the scene to the view
//        sceneView.scene = scene
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let scene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
       
        if let diceNode = scene.rootNode.childNode(withName: "Dice", recursively: true) {
            roll(dice: diceNode)
            
        }
    }
    
    func roll(dice: SCNNode){
        
      let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
      //        let randomY = Double((arc4random_uniform(10) + 11)) * (Double.pi/2)
      let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
      
      dice.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomZ * 5), duration: 0.5))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
