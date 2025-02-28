//
//  MCRI_curriculum.swift
//  Matter_Report
//
//  Created by Victo-Jorge on 27/02/2025.
//

import SwiftUI

struct MCRI_Curiculum: View {
    @State var soft:String = " "
    var body: some View {
        ScrollView{
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
                    .padding(.bottom,50)
                    .padding(.top,50)
                Text("MCRI Curriculum")
                    .fontWeight(.bold)
                    .padding()
                    .underline()
                    .font(.title3)
                
                Text("The matter carrier readiness institute is an institues thats give an opportunity to young adults around Zimbabwe to showcase their talents and learn about the swift programming language.")
                    .padding()
                
                
                
                Section{
                    HStack{
                        ZStack{
                            
                            
                            
                            Spacer()
                            
                                .frame(width: 400, height: 300)
                                .background(Color.orange) // Set the background color here
                                .edgesIgnoringSafeArea(.all)
                            
                            VStack{
                                VStack{
                                    Text("Our mission")
                                        .bold()
                                        .font(.custom("", size: 28))
                                        .padding()
                                    Image(systemName: "cloud.drizzle.fill")
                                        .foregroundColor(.white)
                                    Spacer()
                                    HStack{
                                        VStack{
                                            //                                        Image(systemName: "cloud")
                                        }
                                        Image("Matter1")
                                            .resizable()
                                            .frame(width: 100, height: 120, alignment: .leading)
                                            .clipShape( RoundedRectangle(cornerRadius: 20))
                                            .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                                            .padding()
                                        Text("Creating a better future")
                                            .frame(width: 100, height: 120)
                                            .cornerRadius(20)
                                            .background(Color.white)
                                            .foregroundColor(.black)
                                            .padding()
                                        Text("Changing Zim")
                                            .frame(width: 100, height: 120)
                                            .cornerRadius(20)
                                            .background(Color.white)
                                            .foregroundColor(.black)
                                            .padding()
                                        
                                        
                                    }
                                }
                                Spacer()
                            }
                        }
                        
                    }
                }
                
            }
            
            Text("Books")
                .font(.title)
                .bold()
                .underline()
                .padding(.top, 80)
                .padding(.bottom,20)
            Section{
                HStack{
                    VStack{
                        Image("Swift")
                            .resizable()
                            .frame(width: 100, height: 120, alignment: .leading)
                            .clipShape( RoundedRectangle(cornerRadius: 20))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                            .padding()
                        Link("swift.org", destination: .init(string: "https://www.swift.org")!)
                    }
                    VStack{
                        Image("GTD")
                            .resizable()
                            .frame(width: 100, height: 120, alignment: .leading)
                            .clipShape( RoundedRectangle(cornerRadius: 20))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                            .padding()
                        Link("gettingthingsdone.com", destination: .init(string: "https://gettingthingsdone.com")!)
                    }
                    
                    VStack{
                        Image("Leadershift")
                            .resizable()
                            .frame(width: 100, height: 120, alignment: .leading)
                            .clipShape( RoundedRectangle(cornerRadius: 20))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                            .padding()
                        
                        Link("amazon.com", destination: .init(string: "https://www.amazon.com/Leadershift-Essential-Changes-Leader-Embrace/dp/0718098501")!)
                    }
                    
                    
                    
                }
                
                
                
            }
            Spacer()
            
            Text("Tools for soft skills")
                .font(.title)
                .bold()
                .underline()
                .padding()
            HStack{
                VStack{
                    Image("Linkedin")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .leading)
                        .clipShape( RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                        .padding()
                    
                    Link("linkedin.com", destination: .init(string: "https://www.linkedin.com")!)
                }
                
                VStack{
                    Image("Tedx")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .leading)
                        .clipShape( RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                        .padding()
                    
                    Link("ted.com", destination: .init(string: "https://www.ted.com/about/programs-initiatives/tedx-program")!)
                }
                
                VStack{
                    Image("Zoom")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .leading)
                        .clipShape( RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                        .padding()
                    
                    Link("zoom.com", destination: .init(string: "https://www.zoom.com")!)
                    Spacer()
                }
                
                
            }
            
            Text("Tools hard skills")
                .font(.title)
                .bold()
                .underline()
                .padding()
            HStack{
                VStack{
                    Image("Xcode")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .leading)
                        .clipShape( RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                        .padding()
                    
                    Link("developer.apple.com", destination: .init(string: "https://developer.apple.com/xcode/")!)
                }
                
                VStack{
                    Image("Jira")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .leading)
                        .clipShape( RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                        .padding()
                    
                    Link("atlassian.com", destination: .init(string: "https://www.atlassian.com/software/jira?referer=jira.com")!)
                }
                
                VStack{
                    Image("Bitbucket")
                        .resizable()
                        .frame(width: 100, height: 120, alignment: .leading)
                        .clipShape( RoundedRectangle(cornerRadius: 20))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke( lineWidth: 2))
                        .padding()
                    
                    Link("bitbucket.org", destination: .init(string: "https://bitbucket.org/product/")!)
                    Spacer()
                }
                
            }
            
            Spacer()
            Text("Thank you")
                .font(.system(size: 30, weight: .light, design: .default))
                .padding(.top, 150)
                .frame(width: 400, height: 200)
            
              
        }
    }
}


#Preview {
    MCRI_Curiculum()
}
