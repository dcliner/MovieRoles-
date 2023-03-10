//
//  ContentView.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WebHandler()
    @State private var searchText = ""
    var body: some View {
            NavigationView{
                List (viewModel.movieList ?? [], id: \.id){  movieData in
                        NavigationLink {
                            SingleMovieView(object: movieData)
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: movieData.i?.imageURL ?? "No image")){
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
                                Text(movieData.l )
                                    }
                        }
                        
                    }.navigationTitle("Search Movies").bold()
                    
                }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) { value in
                    if !value.isEmpty && value.count > 3{
                        viewModel.getVideoData(searchTerm: value)
                    }
            }
            
            
        }
        
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

