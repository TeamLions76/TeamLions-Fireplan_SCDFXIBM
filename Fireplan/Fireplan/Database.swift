//
//  Database.swift
//  Fireplan
//
//  Created by Hol Yin Ho on 13/6/20.
//  Copyright © 2020 Hol Yin Ho. All rights reserved.
//

import SwiftCloudant

class Database {
    static let cloudantURL = URL(string:"https://username.cloudant.com")!
    let client = CouchDBClient(url:cloudantURL, username:"username", password:"password")
    let dbName = "database"

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
