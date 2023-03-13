//
//  ContentView.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/8/23.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var webhandler = WebHandler()
    @StateObject private var viewModel = MovieViewModel()
   // @State private var searchText = ""
    var body: some View {
            NavigationView{
                List (viewModel.movieResults , id: \.movieid){  movieData in
                        NavigationLink {
                            SingleMovieView(object: movieData)
                        } label: { HStack { AsyncImage(url: URL(string: movieData.images?.imageURL ?? "No image")){
                                            phase in
                                            switch phase{
                                            case.success(let image):
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame( maxWidth:100 )
                                                //image.scaledToFit()
                                            case.empty:
                                                ProgressView()
                                            case.failure(_):
                                                ProgressView()
                                            @unknown default:
                                                ProgressView()
                                            }
                                        }
                                Text(movieData.movietitle ?? "No title given" )
                                    }
                        }
                        
                    }.navigationTitle("Search Movies").bold()
                    
                }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchText)
//            .onChange(of: viewModel.searchText) { value in
//                    if !value.isEmpty{
//                        webhandler.getVideoData(searchTerm: value)
//                    }
//            }
            
            
        }
        
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

