//
//  Photo.swift
//  API_Test
//
//  Created by Mariano Uriel Delgado on 05/04/2022.
//

import Foundation

class Photo: Codable {
    
    private var albumId:Int
    private var id: Int
    private var title: String
    private var url: String
    private var thumbnailUrl: String
    init(){
        
        self.albumId = 0
        self.id = 0
        self.title = ""
        self.url = ""
        self.thumbnailUrl = ""
    }
    
    func getAlbumId()->Int {return self.albumId}
    func getId()->Int {return self.id}
    func getTitle()-> String {return self.title}
    func getUrl()->URL? {return URL(string: self.url)}
    func getThumbnailUrl()->URL? {return URL(string: self.thumbnailUrl)}


}
