//
//  TableViewController.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 13/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,XMLParserDelegate {

    @IBOutlet var tableViewTest: UITableView!
    
    
    
    var books: [Model.Book] = []
    var elementName: String = String()
    var bookTitle = String()
    var bookAuthor = String()
    var bookAuthor2 = String()
    var imgUrl = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewTest.delegate = self
        tableViewTest.dataSource = self
    
//        var u = ""
//
//        if(Global.url.count>1){
//            u = Global.url
//        }
//
//       // print("url ",u)
//
//        let url = URL(string: u)!
//
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let data = data else { return }
//            if data == nil {
//                print("dataTaskWithRequest error: \(error)")
//                return
//            }
//
//           // print(String(data: data, encoding: .utf8)!)
//            let parser = XMLParser(data: data)
//                parser.delegate = self
//                parser.parse()
//
//        }
//
//        task.resume()
        
        books = Global.books1
        if(Global.indexTab==0){
            books =  Global.books1
        }
        else if(Global.indexTab == 1){
            books = Global.music1
        }
        else if(Global.indexTab == 2){
            books = Global.game1
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
       
        if(Global.books1.count==0 || Global.music1.count==0 || Global.game1.count==0){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            
            if(Global.indexTab==0){
                self.books = Global.books1
            }
            else if(Global.indexTab == 1){
                self.books = Global.music1
            }
            else if(Global.indexTab == 2){
                self.books = Global.game1
            }
            
            print("model book ",self.books)
            self.tableViewTest.reloadData()
        }
        }
        else{
            
            if(Global.indexTab==0){
                self.books = Global.books1
            }
            else if(Global.indexTab == 1){
                self.books = Global.music1
            }
            else if(Global.indexTab == 2){
                self.books = Global.game1
            }
            
            //print("model book ",self.books)
            self.tableViewTest.reloadData()
        }
        
//        if(Global.books1.count>0){
//            // print("books title",books[0].bookTitle)
//            tableViewTest.reloadData()
//        }
//
//        print("model book ",books)
//         tableViewTest.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        if(books.count>0){
            //print("books title",books[0].imgUrl)
            
            let book = books[indexPath.row]
            
            cell.header.text = book.bookTitle
            
            cell.subHeader.text = book.bookAuthor + " " + book.bookAuthor2
            
            let url = URL(string: book.imgUrl)
            let data = try? Data(contentsOf: url!)
            cell.images.image =  UIImage(data: data!)
            
            return cell
        }
        
       // let book = books[indexPath.row]
        
       // cell.title.text = book.bookTitle

        return cell
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
        }
        else if elementName == "itune" {
            let book = Model.Book(bookTitle: bookTitle, bookAuthor: bookAuthor, bookAuthor2: bookAuthor2, imgUrl: imgUrl)
            books.append(book)
        }
        else if elementName == "game" {
            let book = Model.Book(bookTitle: bookTitle, bookAuthor: bookAuthor, bookAuthor2: bookAuthor2, imgUrl: imgUrl)
            books.append(book)
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

