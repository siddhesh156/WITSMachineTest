//
//  Defaults.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 13/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import Foundation

struct Global {
    static var url = "http://www.witsindia.com/ftp/test/books.xml"
    static var books1: [Model.Book] = []
    static var music1: [Model.Book] = []
    static var game1: [Model.Book] = []
    static var indexTab = 0
}


struct Model {
    
    struct Book {
    var bookTitle: String
    var bookAuthor: String
    var bookAuthor2: String
    var imgUrl: String
}
    
    struct Music {
        var bookTitle: String
        var bookAuthor: String
        var bookAuthor2: String
        var imgUrl: String
    }
    
}
