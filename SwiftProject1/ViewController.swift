//
//  ViewController.swift
//  SwiftProject1
//
//  Created by wanplus on 2016/10/17.
//  Copyright © 2016年 wanplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBAction func clickButton(_ sender: AnyObject) {
        let childVC = ChildViewController1()
//        self.present(childVC, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(childVC, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

