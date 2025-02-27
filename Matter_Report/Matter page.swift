//
//  Matter page.swift
//  MatterReport
//
//  Created by Albertina Bongani on 2/27/25.
//

import SwiftUI
import PhotosUI


struct Photo: Identifiable {
    var id = UUID()
    var imageName: String
       var label: String
}
struct Matter_page: View {
    @State private var searchItem: String = ""
    @State private var photos: [Photo] = [
          Photo(imageName: "Chaya", label: "Chaya Tree Project"),
          Photo(imageName: "MCRI", label: "Matter Career Readiness Institute"),
          Photo(imageName: "KebemerHospital", label: "Kebemer Hospital"),
          Photo(imageName: "Samkele Park", label: "Samkele Park"),
          Photo(imageName: "MatterInnovation", label: "MatterInnovation")
          
      ]

    let columns = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                Image("MatterLogo")
                    .resizable()
                    .frame(width: 220, height: 200)
                    .overlay{
                        Circle()
                            .stroke(.white , lineWidth: 4)
                            .shadow(radius: 10)
                            .frame(width: 250, height: 225)
                    }
                    .frame(width: 200, height: 200)

                Spacer()
                
                
                
                TextField("Search", text: $searchItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .fill(Color.gray)
                            .background(.gray.opacity(0.2))
                            .frame(width: 390, height: 37)
                    )

                    .padding()
                
                    
                
                Spacer()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(photos) { photo in
                            VStack {
                                Image(photo.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 100)
                                
                                Text(photo.label)
                                    .foregroundColor(.black)
                                    .font(.headline)
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    
                }
                
                .frame(maxHeight: 600)
                
                HStack{
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.black)
                        .font(.title2)
                    Text("Add Profile")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    Matter_page()
}
