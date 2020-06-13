//
//  Database.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import SwiftCloudant

class Database {
    static let cloudantURL = URL(string:"https://" + Keys.username + ".cloudant.com")!
    let client = CouchDBClient(
        url:cloudantURL,
        username: Keys.username,
        password: Keys.password)
    let dbName = "fire-type"

    func readDB(callback: @escaping ([FireType]) -> Void) {
        let read = GetDocumentOperation(id: "doc1", databaseName: dbName) { (response, httpInfo, error) in
            if let error = error {
                print("Encountered an error while reading a document. Error:\(error)")
            } else {
                let fireTypes = response!["allFires"] as! Array<Any>
                var fireTypeDTOs: [FireType] = []
                fireTypes.forEach {
                    fireTypeDTOs.append(FireType(from: $0)!)
                }
                callback(fireTypeDTOs)
            }
        }
        client.add(operation:read)
    }
}
