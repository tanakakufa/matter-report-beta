//
//  reportTemplates.swift
//  MatterReport
//
//  Created by Mildred Ngoma  on 2/27/25.
//

import SwiftUI

struct MCRISponsors: View {
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    ScrollView{
                        Image("Jamflogo")
                            .resizable()
                            .frame(width: 350, height: 300)
                            .scaledToFill()
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1)
                            }
                        Link("Jamf.com", destination: .init(string: "https://www.jamf.com/about/")!)
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom)
                        
                        Image("Mainsllogo")
                            .resizable()
                            .frame(width: 350, height: 300)
                            .scaledToFill()
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1)
                            }
                        Link("Mainsl.com", destination: .init(string: "https://www.mainsl.com/what-we-do/")!)
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom)
                        
                        Image("Tradition")
                            .resizable()
                            .frame(width: 350, height: 300)
                            .scaledToFill()
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1)
                            }
                        Link("Tradition.bank", destination: .init(string: "https://www.tradition.bank")!)
                            .font(.title)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom)
                        
                        Image("MatterLogo")
                            .resizable()
                            .frame(width: 350, height: 300)
                            .scaledToFill()
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1)
                            }
                        
                            Spacer()
                            Link("matter.ngo", destination: .init(string: "https://www.matter.ngo")!)
                                .font(.title)
                                .foregroundColor(.black)
                                .bold()
                                .padding(.bottom)
                        
                    }
                    .navigationTitle("Sponsors")
                    
                }
                
            }
        }
        
    }
}
#Preview {
    MCRISponsors()
}
