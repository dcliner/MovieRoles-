//
//  SingleMovieView.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/8/23.
//

import SwiftUI

struct SingleMovieView: View {
    let object:D
    var body: some View {
        VStack{
            Text("\(object.movietitle ?? "No title given")").font(.largeTitle).fontWeight(.heavy)
        
            VStack{
                AsyncImage(url: URL(string: object.images?.imageURL ?? "No image")){
                    phase in
                    switch phase{
                    case.success(let image):
                        image.resizable()
                    case.empty:
                        ProgressView()
                    case.failure(_):
                        ProgressView()
                    @unknown default:
                        ProgressView()
                    }
                }.frame( maxWidth:350 , maxHeight: 350)
                    .padding()
                VStack{
                    HStack{
                        Text("Title: \(object.movietitle ?? "No title given")")
                            
                    }
                    HStack{
                        Text("Actors: \(object.actors ?? "No actors listed")")
                            .fontWeight(.bold)
                    }
                    HStack{
                        Text("Rank: \(object.movierank ?? 0)")
                            
                        Text("Year: \(object.movieyear ?? 0)")
                            
                    }
                    HStack{
                        Text("Type: \(object.featureid ?? "No feature")")
                        
                    }
                    
                }
                Spacer()
                Spacer()
                
            }
        }
    }
}
//struct SingleMovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleMovieView()
//    }
//}
