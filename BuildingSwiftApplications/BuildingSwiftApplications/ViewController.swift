//
//  ViewController.swift
//  BuildingSwiftApplications
//
//  Created by Jon Manning on 22/07/2016.
//  Copyright © 2016 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var documentsFolderURL : NSURL {
        
        let URLs = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        
        let documentURL = URLs[0]
        
        return documentURL
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let data = "Hello, world".dataUsingEncoding(NSUTF8StringEncoding) else {
            return
        }
        
        let textFileURL = documentsFolderURL.URLByAppendingPathComponent("Hello.txt")
        
        print(textFileURL)
        
        do {
            try data.writeToURL(textFileURL, options: [])
        } catch let error {
            print("there was an error: \(error)")
        }
        
        let loadedData = NSData(contentsOfURL: textFileURL)
        
        
        guard let imageURL = NSURL(string: "https://placekitten.com/g/200/300") else {
            print("Invalid URL!")
            return
        }
        
        NSURLSession.sharedSession().dataTaskWithURL(imageURL) { (data, response, error) in
            
            guard let theData = data else {
                print("Didn't get any data!")
                return
            }
            
            guard let image = UIImage(data: theData) else {
                print("Failed to get an image!")
                return
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                self.imageView.image = image
            })
        }.resume()
        
    }

    @IBAction func showPurpleScreen(sender: AnyObject) {
        
        self.performSegueWithIdentifier("showScreen", sender: self)
        
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        label.text = "Button was tapped!"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

