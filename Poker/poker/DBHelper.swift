//
//  DBHelper.swift
//  poker
//  table creation and insertion of login data ????
//  Created by Kate on 12/7/21.
//

import Foundation
import SQLite3
import SwiftUI

class DBHelper{
    var db: OpaquePointer?
    var path : String = "myDB.sqlite"
    init()
    {
        self.db = createDB()
        self.createTable() 
    }
        func createDB() -> OpaquePointer? {
            let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
            var db : OpaquePointer? = nil
            if sqlite3_open(filePath.path, &db) != SQLITE_OK {
                print("could not create db")
                return nil
            }
            else{
                print("database created with path \(path)")
                return db
            }
        }
        
    func createTable(){
        let query = "CREATE TABLE IF NOT EXISTS login(userName TEXT PRIMARY KEY, password TEXT);"
        var stuff : OpaquePointer? = nil
        if sqlite3_prepare_v2(self.db, query, -1, &stuff, nil) == SQLITE_OK {
            if sqlite3_step(stuff) == SQLITE_DONE {
                print("creation success")
            }
            else{
                print("creation failure")
            }
        }
        else{
            print("failure")
        }
    }
    func insert(userName: String, password: String){
        let query = "INSERT INTO login (userName, password) VALUES (?, ?)"
        var stuff : OpaquePointer? = nil
        if sqlite3_prepare_v2(db, query, -1, &stuff, nil) == SQLITE_OK {
            sqlite3_bind_text(stuff, 1, (userName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(stuff, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(stuff) == SQLITE_DONE {
                print("LOGIN success")
                print(userName, "login")
            }
            else{
                print("LOGIN success")
            }
        }
        else{
            print("not it")
        }
    }
}
