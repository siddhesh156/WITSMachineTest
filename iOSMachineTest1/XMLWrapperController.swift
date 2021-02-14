//
//  XMLWrapperController.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 14/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class XMLWrapperController: UIViewController,XMLParserDelegate {
    
    var books: [Model.Book] = []
    var elementName: String = String()
    var bookTitle = String()
    var bookAuthor = String()
    var bookAuthor2 = String()
    var imgUrl = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
     func api()
    {
        var u = ""
        
        if(Global.url.count>1){
            u = Global.url
        }
        
        print("url 2 ",u)
        
        let url = URL(string: u)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            if data == nil {
                print("dataTaskWithRequest error: \(error)")
                return
            }
            
            // print(String(data: data, encoding: .utf8)!)
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
            
        }
        
        task.resume()
        
        
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "book" {
            bookTitle = String()
            bookAuthor = String()
            bookAuthor2 = String()
            imgUrl = String()
        }
        else if elementName == "itune" {
            bookTitle = String()
            bookAuthor = String()
            bookAuthor2 = String()
            imgUrl = String()
        }
        else if elementName == "game" {
            bookTitle = String()
            bookAuthor = String()
            bookAuthor2 = String()
            imgUrl = String()
        }
        
        self.elementName = elementName
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "book" {
            let book = Model.Book(bookTitle: bookTitle, bookAuthor: bookAuthor, bookAuthor2: bookAuthor2, imgUrl: imgUrl)
            books.append(book)
            
            Global.books1 = books
            print("model 2 ",Global.books1)
            
            
        }
        else if elementName == "itune" {
            let book = Model.Book(bookTitle: bookTitle, bookAuthor: bookAuthor, bookAuthor2: bookAuthor2, imgUrl: imgUrl)
            books.append(book)
            Global.music1 = books
        }
        else if elementName == "game" {
            let book = Model.Book(bookTitle: bookTitle, bookAuthor: bookAuthor, bookAuthor2: bookAuthor2, imgUrl: imgUrl)
            books.append(book)
            Global.game1 = books
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "Title" {
                bookTitle += data
            } else if self.elementName == "AutorFName1" {
                bookAuthor += data
            }
            else if self.elementName == "AutorLName1" {
                bookAuthor2 += data
            }
            else if self.elementName == "ThumbURL" {
                imgUrl += data
            }
            else if self.elementName == "FolgeNo" {
                bookAuthor += data
            }
            else if self.elementName == "Platform" {
                bookAuthor += data
            }
        }
    }

}
