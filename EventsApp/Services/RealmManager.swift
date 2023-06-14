//
//  RealmManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import RealmSwift

class RealmManager {
    var realm = try! Realm()
    lazy var objects: Results<RealmData> = {
        realm.objects(RealmData.self)
    }()
    
    func dataBaseAdd(object: RealmData) {
        let info = RealmData(id: object.id,
                             name: object.name,
                             eventDescription: object.eventDescription,
                             location: object.location,
                             category: object.category,
                             dates: object.dates,
                             images: object.images)
        do {
            try realm.write {
                realm.add(info)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dataBaseUpdate(event: String, index: Int) {
        let saving = objects[index]
        do {
            try realm.write {
                saving.eventDescription = event
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dataBaseDelete(index: Int) {
        let objectForDelete = objects[index]
        do {
            try realm.write {
                realm.delete(objectForDelete)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dataBaseClear() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dataBaseGetObjects() -> Results<RealmData> {
        realm.objects(RealmData.self)
    }
    
}
