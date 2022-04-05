//
//  APIManager.swift
//  API_Test
//
//  Created by Mariano Uriel Delgado on 05/04/2022.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager(baseURL: URL(string: "https://jsonplaceholder.typicode.com")!)
    
    
    let baseURL : URL
    
    private init(baseURL : URL){
        self.baseURL = baseURL
    }
    
    func getPhotos(completion: @escaping([Photo]?, String?)-> Void){
        AF.request(self.baseURL.appendingPathComponent("/photos"), method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON
        {(response)in
            if let data = response.data{
                do {
                    let fotos = try JSONDecoder().decode([Photo].self, from: data)
                    completion(fotos, nil)
                }catch{
                    completion(nil, "Error Decode")
                }
            }else{
                completion(nil,"Error Conexion")
            }
        }
    }
    
    
}



