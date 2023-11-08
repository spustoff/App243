//
//  MainViewModel.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {
 
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var selectedModel: MainModel?
    
    @Published var price: String = ""
    @Published var formats: String = ""
    @Published var sites: String = ""
    
    @Published var images: [MainModel] = []
    
    func fetchImages() {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MainModel>(entityName: "MainModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.images = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.images = []
        }
    }
    
    func addImage(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "MainModel", into: context) as! MainModel
        
        trans.price = Int16(price) ?? 0
        trans.formats = formats
        trans.sites = sites
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
}
