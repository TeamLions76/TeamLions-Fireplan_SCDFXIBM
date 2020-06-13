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

    func populateDB() {
        let create = PutDocumentOperation(id: "doc1", body: ["hello":"world"], databaseName: dbName) {(response, httpInfo, error) in
            if let error = error as? SwiftCloudant.Operation.Error {
                switch error {
                case .http(let httpError):
                    print("http error status code: \(httpError.statusCode)  response: \(httpError.response)")
                default:
                    print("Encountered an error while creating a document. Error:\(error)")
                }
            } else {
                print("Created document \(response?["id"]) with revision id \(response?["rev"])")
            }
        }
        client.add(operation:create)
    }

    func readDB() {
        let read = GetDocumentOperation(id: "doc1", databaseName: dbName) { (response, httpInfo, error) in
            if let error = error {
                print("Encountered an error while reading a document. Error:\(error)")
            } else {
                print("Read document: \(response)")
            }
        }
        client.add(operation:read)
    }

    /*
    /* Read the Cloudant credentials and intialize database connection */
    if let contents = Bundle.main.path(forResource:"BMSCredentials", ofType: "plist"), let dictionary = NSDictionary(contentsOfFile: contents) {
        let url = URL(string: dictionary["cloudantUrl"] as! String)
        let client = CouchDBClient(url:url!,
                                   username:dictionary["cloudantUsername"] as? String,
                                   password:dictionary["cloudantPassword"] as? String)
    }
 */

}
