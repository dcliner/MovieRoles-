//
//  ApiManager.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/8/23.
//

import Foundation
import Combine


class WebHandler:ObservableObject {
    @Published var movieList: [D]?
      
   
    func getVideoData(searchTerm:String ){
        var request = URLRequest(url: URL(string: "https://imdb8.p.rapidapi.com/auto-complete?q=\(searchTerm.trimmed())")!,timeoutInterval: Double.infinity)
        request.addValue(Keys.APIKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.addValue("imdb8.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let moviedata = data else {
                print(String(describing: error))
                return
            }
            
            print(String(data: moviedata, encoding: .utf8)!)
            do{
                let movieData = try JSONDecoder().decode(MovieDetails.self, from: moviedata)
                DispatchQueue.main.async {
                    self.movieList = movieData.movies
                } 
                //print(String(data: movieData, encoding: .utf8)!)
            }catch{
                print (error)
            }
        }
        
        task.resume()
        
    }
    
    
}
    


