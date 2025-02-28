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
    var destination: AnyView
}

struct Matter_page: View {
    @State private var searchItem: String = ""
    
    @State private var photos: [Photo] = [
        Photo(imageName: "Chaya", label: "Chaya Tree Project", destination: AnyView(RoleView())),
        Photo(imageName: "KebemerHospital", label: "Kebemer Hospital", destination: AnyView(RoleView())),
        Photo(imageName: "Samkele Park", label: "Samkele Park", destination: AnyView(RoleView())),
        Photo(imageName: "MatterInnovation", label: "Matter Innovation", destination: AnyView(RoleView())),
        Photo(imageName: "Binga", label: "Binga Hospital", destination: AnyView(RoleView())),
        Photo(imageName: "Bismark", label: "Bismark Foundation", destination: AnyView(RoleView())),
        Photo(imageName: "Chidobe", label: "Chidobe Chaya Center", destination: AnyView(RoleView())),
        Photo(imageName: "Foundation", label: "Luol Foundation", destination: AnyView(RoleView())),
        Photo(imageName: "MaternityWard", label: "Pediatric Hospital", destination: AnyView(RoleView())),
        Photo(imageName: "MCRI", label: "Matter Career Readiness Institute", destination: AnyView(RoleView()))
    ]
    
   
    var filteredPhotos: [Photo] {
        if searchItem.isEmpty {
            return photos
        } else {
            return photos.filter { $0.label.localizedCaseInsensitiveContains(searchItem) }
        }
    }
    
    let columns = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
                    Image("MatterLogo")
                        .resizable()
                        .frame(width: 220, height: 200)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 10)
                                .frame(width: 250, height: 225)
                        )
                        .frame(width: 200, height: 200)
                    
                    Spacer()
                    
                    TextField("Search", text: $searchItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.all, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                                .fill(Color.gray)
                                .background(Color.gray.opacity(0.2))
                                .frame(width: 390, height: 37)
                        )
                        .padding()
                    
                    Spacer()
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredPhotos) { photo in
                                VStack {
                                    Image(photo.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 100)
                                    
                                    NavigationLink(destination: photo.destination) {
                                        Text(photo.label)
                                            .foregroundColor(.black)
                                            .font(.headline)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(maxHeight: 600)
                    
                    HStack {
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
}

#Preview {
    Matter_page()
}
