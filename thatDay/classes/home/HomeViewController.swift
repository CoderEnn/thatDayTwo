//
//  HomeViewController.swift
//  thatDay
//
//  Created by zz on 16/4/25.
//  Copyright © 2016年 me. All rights reserved.
//

import UIKit
import CoreData
// MARK: - NSObjectProtocol
protocol passValueDelegete: NSObjectProtocol {
    
    func passValue(person: Person)
}


class HomeViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
    
             try! fetchResultsController.performFetch()
        //下面这句不能放在performFetch前
        tableView.tableFooterView = UIView()
        
        let systemVersion = UIDevice.currentDevice().systemVersion as NSString
        if systemVersion.floatValue >= 8.0 {
         modalPresentationStyle = .CurrentContext
        }
    }
    
       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "newEventSegue" {
        
            
            let popController = segue.destinationViewController.popoverPresentationController
            popController!.delegate = self
            
            
            if segue.destinationViewController.isKindOfClass(NewEventViewController.self) {
            
                let vc = segue.destinationViewController as! NewEventViewController
                vc.clouser = {person in
                    
                    let object = AVObject(className: "Idd")
//                   let personArr = AVObject(className: "Pobek")
                    object.setObject(person.event, forKey: "event")
                    
                    object.setObject(person.lasting, forKey: "lasting")
                    
                    object.setObject(person.remind, forKey: "remind")
                    

                    object.saveInBackgroundWithBlock({ (_, error) in
                        if error == nil {
                       person.leancloudId = object.objectId
                            ZDCoreDataManager.sharedCoreDataManager.saveContext()
                            print(person)

                        }

                    })
                    
                    
                 try! self.fetchResultsController.performFetch()
                    self.tableView?.reloadData()
                }
            }
        }
        
    }


    func creatData(){
        for e in 0..<5 {
            
            let person: ZDEventModel = NSEntityDescription.insertNewObjectForEntityForName("ZDEventModel", inManagedObjectContext: ZDCoreDataManager.sharedCoreDataManager.managedObjectContext) as! ZDEventModel
            person.event = "event\(e)"
            person.lasting = "lasting\(e)"
            person.remind = "remind\(e)"
            
        }
        ZDCoreDataManager.sharedCoreDataManager.saveContext()
        print("save ok")


    }
    

    

    lazy var fetchResultsController: NSFetchedResultsController = {
        let fetchR: NSFetchRequest = NSFetchRequest(entityName: "ZDEventModel")
        let sort: NSSortDescriptor = NSSortDescriptor(key: "event", ascending: true)
        fetchR.sortDescriptors = [sort]
//        fetchR.fetchLimit = 10
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchR, managedObjectContext: ZDCoreDataManager.sharedCoreDataManager.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchResultsController
    }()
    
    
    var delegate: passValueDelegete?
}



extension HomeViewController: UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        
        return .None
    }

}
// MARK: - UITableViewDataSource
extension HomeViewController{

     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (fetchResultsController.sections?.count)!
        print(fetchResultsController.sections![section].numberOfObjects)
        return fetchResultsController.sections![section].numberOfObjects
        

    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return fetchResultsController.sections![section].name
//    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: ZDTableViewCell = tableView.dequeueReusableCellWithIdentifier("zd", forIndexPath: indexPath) as! ZDTableViewCell

//        let personE = fetchResultsController.fetchedObjects![indexPath.row]
       
        let personE =  fetchResultsController.sections![indexPath.section].objects![indexPath.row]
        cell.eventModel = personE as? ZDEventModel
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension HomeViewController {
 
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
        switch ZDNetworking.sharedTool.reachabilityStatus {
        case .ReachableViaWWAN:
            print("wwan")
            break
        case .ReachableViaWiFi:
            print("wifi")
            break
        case .Unknown:
            print("未知")
            break
        case .NotReachable:
            print("unuse")
            break
        default:
            break
        }
//        print(ZDNetworking.sharedTool.reachabilityManager.networkReachabilityStatus)
        if !ZDNetworking.sharedTool.reachable {
            print("没有网络")
        }else {
            print("有网络")
        }
        let story = UIStoryboard(name: "Home", bundle: nil)
        let vc: NewEventViewController = story.instantiateViewControllerWithIdentifier("newEvent") as! NewEventViewController

        presentViewController(vc, animated: true, completion: nil)
        let personE = fetchResultsController.fetchedObjects![indexPath.row]
        vc.person = personE as! ZDEventModel
        vc.clouser = {person in
            let object = AVObject(className: "Idd", objectId: person.leancloudId)
            object.setObject(person.event, forKey: "event")
            
            object.setObject(person.lasting, forKey: "lasting")
            
            object.setObject(person.remind, forKey: "remind")
            print("object == \(object)")
            
            object.saveInBackgroundWithBlock({ (_, error) in
                if error == nil {
                    self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                }
                
            })
            
        }

    }
}



