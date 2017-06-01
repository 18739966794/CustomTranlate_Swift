//
//  ChildViewController1.swift
//  SwiftProject1
//
//  Created by wanplus on 2016/10/17.
//  Copyright © 2016年 wanplus. All rights reserved.
//

import UIKit

class ChildViewController1: UIViewController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var label: UILabel!
    
    var myView: MyView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        
        self.navigationController!.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        myView = MyView() { [unowned self] in
            self.testMethod()
        }
    }
    
    func testMethod() {
        label.text = "hahaha"
    }
    
    
    @IBAction func clickClose(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickPush(_ sender: Any) {
        let childVC2: ChildViewController2 = ChildViewController2()
        self.navigationController?.pushViewController(childVC2, animated: true)
    }
    
    @IBAction func clickPresent(_ sender: Any) {
        let childVC2: ChildViewController2 = ChildViewController2()
        self.present(childVC2, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return CustomPushTransitionAnimation()
        }
        else if operation == .pop {
            return CustomPopTransitionAnimation()
        }
        return nil
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissAniamtion()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//extension ChildViewController1 : UINavigationControllerDelegate{
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        <#code#>
//    }
//}


