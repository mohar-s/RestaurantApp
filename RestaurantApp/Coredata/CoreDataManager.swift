//
//  CoreDataManager.swift
//  RestaurantApp
//
//  Created by Mohar on 13/12/21.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    static let sharedInstance: CoreDataManager = {
        let instance = CoreDataManager()
        // setup code
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(instance,
                                       selector:#selector(managedObjectContactContextDidSave(notification:)),
                                       name: NSNotification.Name.NSManagedObjectContextDidSave,
                                       object: instance.privateManagedObjectContext)
        
        return instance
    }()
    
    @objc func managedObjectContactContextDidSave(notification: Notification) {
           DispatchQueue.main.async {
               print("merged")
           }
       }
    
    lazy var privateManagedObjectContext: NSManagedObjectContext = {
           let context = self.persistentContainer.newBackgroundContext()
           context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
//           context.retainsRegisteredObjects = true
           return context
       }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Restaurant")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSOverwriteMergePolicy
        return container
    }()
    
    
    func insertNewModel(name : String) -> NSManagedObject {
        let context : NSManagedObjectContext  = privateManagedObjectContext
        let newOnject : NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: name, into: context)
        return newOnject
    }
    
    
    func fetchModel(request : NSFetchRequest<NSFetchRequestResult>, result : @escaping ([NSManagedObject])->()) {
            
             let context : NSManagedObjectContext  = privateManagedObjectContext
                var records : [NSManagedObject] = []
                do {
                    records = try context.fetch(request) as! [NSManagedObject]
                    result(records)
                } catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
                    result(records)
                }
        }
    
    func savePrivateContext() {
        self.privateManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
           if (self.privateManagedObjectContext.hasChanges == true) {
               do {
                    try self.privateManagedObjectContext.save()
               } catch let error as NSError {
                   print("Could not save. phMessagePrivateManagedObjectContext \(error), \(error.userInfo)")
               }
           }
       }
    
    
    func executeDeleteRequest (batchDeleteRequest: NSBatchDeleteRequest) {
        let context : NSManagedObjectContext  = privateManagedObjectContext
        do{
            let result = try context.execute(batchDeleteRequest)  as? NSBatchDeleteResult
            let objectIDArray = result?.result as? [NSManagedObjectID]
            let changes = [NSDeletedObjectsKey : objectIDArray]
            NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes as [AnyHashable : Any], into: [context])
            
        } catch let error as NSError {
            print("error deleting items",error.localizedDescription)
        }
    }
    
    
    func getAllCoisineList() -> [Cuisine] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cuisine")

        var list: [Cuisine]!
        CoreDataManager.sharedInstance.fetchModel(request: fetchRequest,
            result: { (records: [NSManagedObject]) -> () in
                list = records as? [Cuisine]
                print("conversationList Count \(list.count)")
            })
        return list
    }
    
    func getfamousFoodItemList() -> [FoodItem] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodItem")

        var list: [FoodItem]!
        CoreDataManager.sharedInstance.fetchModel(request: fetchRequest,
            result: { (records: [NSManagedObject]) -> () in
                list = records as? [FoodItem]
                print("conversationList Count \(list.count)")
            })
        return list
    }
    
    func getCoisineForID(cuisineID : Int) -> Cuisine? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cuisine")
        fetchRequest.predicate = NSPredicate(format: "cuisineID == %d", cuisineID)
        var list: [Cuisine]!
        CoreDataManager.sharedInstance.fetchModel(request: fetchRequest,
            result: { (records: [NSManagedObject]) -> () in
                list = records as? [Cuisine]
                print("conversationList Count \(list.count)")
            })
        if list.count > 0 {
            return list.first
        } else {
            return nil
        }
    }
    
    
}
