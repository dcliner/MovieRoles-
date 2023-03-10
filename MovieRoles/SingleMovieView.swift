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
            Text("\(object.l)").font(.largeTitle).fontWeight(.heavy)
            
            VStack{
                AsyncImage(url: URL(string: object.i?.imageURL ?? "No image")){
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
                        Text("Title: \(object.l)")
                            
                    }
                    HStack{
                        Text("Actors: \(object.s)")
                            .fontWeight(.bold)
                    }
                    HStack{
                        Text("Rank: \(object.rank ?? 0)")
                            
                        Text("Year: \(object.yr ?? "No year given")")
                            
                    }
                    HStack{
                        Text("Type: \(object.qid ?? "No feature")")
                        
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
