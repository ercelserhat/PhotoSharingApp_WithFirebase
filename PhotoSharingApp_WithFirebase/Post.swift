//
//  Post.swift
//  PhotoSharingApp_WithFirebase
//
//  Created by Serhat on 28.06.2023.
//

import Foundation

class Post{
    var email: String
    var yorum: String
    var gorsel: String
    
    init(email: String, yorum: String, gorsel: String) {
        self.email = email
        self.yorum = yorum
        self.gorsel = gorsel
    }
}
