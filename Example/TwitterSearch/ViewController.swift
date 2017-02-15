//
//  ViewController.swift
//  TwitterSearch
//
//  Created by Boris Estrin on 02/15/2017.
//  Copyright (c) 2017 Boris Estrin. All rights reserved.
//

import UIKit
import TwitterSearch

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TwitterSearch.Api.getTweetsArray(searchPhrase: "#barcelona #psg"){status,tweetsArray,error in
            if status{
                for tweet in tweetsArray!{
                    print("\(tweet)\n")
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

