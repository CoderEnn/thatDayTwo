//
//  NewEventViewController.swift
//  thatDay
//
//  Created by zz on 16/4/26.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
import CoreData


class NewEventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGrayColor()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
 
    @IBAction func save(sender: AnyObject) {
        
        if !eventText.hasText() && !timeText.hasText() && !lastingText.hasText() && !remindText.hasText(){
            return
        }
  
        person.event = eventText.text
        person.time = nil
        person.lasting = lastingText.text
        person.remind = remindText.text
        
        ZDCoreDataManager.sharedCoreDataManager.saveContext()
        
        clouser?(person: person)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    var person1: ZDEventModel = ZDEventModel(entity: NSEntityDescription(), insertIntoManagedObjectContext: ZDCoreDataManager.sharedCoreDataManager.managedObjectContext)
    
    
    var person: ZDEventModel = NSEntityDescription.insertNewObjectForEntityForName("ZDEventModel", inManagedObjectContext: ZDCoreDataManager.sharedCoreDataManager.managedObjectContext) as! ZDEventModel{
        didSet{
        eventText.text = person.event
        lastingText.text = person.lasting
        remindText.text = person.remind
        }
    }
    
    
    var clouser: ((person: ZDEventModel)->())?
    
    
    @IBOutlet weak var eventText: UITextField!
    
    @IBOutlet weak var timeText: UITextField!
    
    @IBOutlet weak var lastingText: UITextField!
    
    @IBOutlet weak var remindText: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let pop = segue.destinationViewController.popoverPresentationController
        pop?.delegate = self
    }
}






extension NewEventViewController:UIPopoverPresentationControllerDelegate {


     func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle{
    
        return .None
    }
}
