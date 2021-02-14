//
//  TableViewController.swift
//  iOSMachineTest1
//
//  Created by siddhesh on 13/02/21.
//  Copyright © 2021 siddhesh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

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
    
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
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
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
       
        if(Global.books1.count==0 || Global.music1.count==0 || Global.game1.count==0){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            if(Global.indexTab==0){
                self.books = Global.books1
            }
            else if(Global.indexTab == 1){
                self.books = Global.music1
            }
            else if(Global.indexTab == 2){
                self.books = Global.game1
            }
           
            self.tableViewTest.reloadData()
            
            self.dismiss(animated: false, completion: nil)
            
          
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
            
            self.tableViewTest.reloadData()
            
            dismiss(animated: false, completion: nil)
            
          
        }
             
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
            
            let book = books[indexPath.row]
            
            cell.header.text = book.bookTitle
            
            cell.subHeader.text = book.bookAuthor + " " + book.bookAuthor2
            
            let url = URL(string: book.imgUrl)
            let data = try? Data(contentsOf: url!)
            cell.images.image =  UIImage(data: data!)
            
            return cell
        }
    

        return cell
    }
    
}

