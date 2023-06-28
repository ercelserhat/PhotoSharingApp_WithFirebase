//
//  FeedViewController.swift
//  PhotoSharingApp_WithFirebase
//
//  Created by Serhat on 26.06.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var postDizisi = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        firebaseVerileriAl()
    }
    
    func firebaseVerileriAl(){
        let firestoreDatabase = Firestore.firestore()
        //.whereField("email", isEqualTo: "asdf@gmail.com")
        firestoreDatabase.collection("Post").order(by: "tarih", descending: true).addSnapshotListener { snapShot, error in
            if error != nil{
                print(error?.localizedDescription)
            }else{
                if snapShot?.isEmpty != true && snapShot != nil{
                    self.postDizisi.removeAll(keepingCapacity: false)
                    
                    for document in snapShot!.documents{
                        let documentId = document.documentID
                        if let gorselUrl = document.get("gorselurl") as? String{
                            if let yorum = document.get("yorum") as? String{
                                if let email = document.get("email") as? String{
                                    let post = Post(email: email, yorum: yorum, gorsel: gorselUrl)
                                    self.postDizisi.append(post)
                                }
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        cell.emailText.text = postDizisi[indexPath.row].email
        cell.yorumText.text = postDizisi[indexPath.row].yorum
        cell.postImageView.sd_setImage(with: URL(string: self.postDizisi[indexPath.row].gorsel))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(375)
    }
}
