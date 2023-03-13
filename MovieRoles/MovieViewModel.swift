//
//  MovieViewModel.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/11/23.
//

import Foundation
import Combine

class MovieViewModel:ObservableObject{
    var movies: Set<AnyCancellable> = []
    @Published var searchText: String  = ""
    @Published var movieResults: [D] = []
    private var moviedata: [D] = []
    private var webhandler = WebHandler()

    
//        .onChange(of: viewModel.searchText) { searchText in
//                if !searchText.isEmpty{
//                    webhandler.getVideoData(searchTerm: searchText)
//                }
//   webhandler.movielist
    
    
    init() {
        
        
        $searchText
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map{_ in self.sortmovies(searchText: self.searchText)}
            .assign(to: &$movieResults)
            
    }
    
    private func sortmovies(searchText: String ) -> [D]{
        if !searchText.isEmpty{
       webhandler.getVideoData(searchTerm: searchText)
        }
        return webhandler.movieList ?? []
    }
    
    
}

